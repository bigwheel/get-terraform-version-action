# https://bats-core.readthedocs.io/en/latest/tutorial.html#quick-installation
setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR/../src:$PATH"
}

@test "there is no .terraform-version file" {
    tmpdir=$(mktemp -d)

    run main.sh $tmpdir

    assert_failure
    assert_output '.terraform-version file not found.'
}

@test ".terraform-version file in the directory" {
    tmpdir=$(mktemp -d)
    echo '0.11.7' > $tmpdir/.terraform-version

    run main.sh $tmpdir

    assert_success
    assert_output '0.11.7'
}

@test ".terraform-version file in parent directory" {
    tmpdir=$(mktemp -d)
    mkdir $tmpdir/child
    echo '0.11.8' > $tmpdir/.terraform-version

    run main.sh $tmpdir/child

    assert_success
    assert_output '0.11.8'
}
