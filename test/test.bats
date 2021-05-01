# https://bats-core.readthedocs.io/en/latest/tutorial.html#quick-installation
setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR/../src:$PATH"
}


@test "simple" {
    tmpdir=$(mktemp -d)
    echo '0.11.7' > $tmpdir/.terraform-version
    run main.sh $tmpdir
    assert_output '0.11.7'
}
