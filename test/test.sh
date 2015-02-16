#!/bin/bash
#
# Test if everything is ok to use geheim
#

echo
echo "Running tests for geheim..."
echo

echo -n "Checking operating system..."
if uname -s | grep -E '(Linux|Darwin|BSD)' &>/dev/null
then
	uname -s
else
	echo "Unknown ($(uname -s))"
	echo "Your operating system is unknown/not tested, if everything works fine, please"
	echo "contact us so we can add it to the supported operating systems."
fi

echo -n "Searching for GnuPG... "
if which gpg &>/dev/null
then
	echo "Found ($(gpg --version | head -n1))"
else
	echo 'NOT FOUND!'
	echo "gpg is not installed or not in \$PATH. Please make sure"
	echo "that gpg is available, since geheim can't run without."
	exit 1
fi

echo -n "Running test for action list... "
OUTPUT=$(env GEHEIM_DATA="test/geheim.db" bin/geheim list | tr "\n" ":")
if [[ "x$OUTPUT" == "x/email/john@doe.name:/nas:/social/twitter/john_doe:" ]]
then
	echo "Ok."
else
	echo 'Failed!'
	exit 1
fi

echo -n "Running test for action get... "
OUTPUT=$(env GEHEIM_DATA="$PWD/test/geheim.db" bin/geheim get /nas | tr "\n" ":")
if [[ "x$OUTPUT" == "xUser: admin:Password: foobar42:" ]]
then
	echo "Ok."
else
	echo 'Failed!'
	echo "x${OUTPUT}x"
	exit 1
fi

echo -n "Running test for action add... "
echo "test.sh" | env GEHEIM_DATA="$PWD/test/geheim.db" bin/geheim add /test &>/dev/null
OUTPUT=$(env GEHEIM_DATA="test/geheim.db" bin/geheim get /test | tr "\n" ":")
if [[ "x$OUTPUT" == "xtest.sh:" ]]
then
	echo "Ok."
else
	echo 'Failed!'
	exit 1
fi

echo "All tests passed. :)"
