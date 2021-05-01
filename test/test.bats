# https://bats-core.readthedocs.io/en/latest/tutorial.html#quick-installation
setup() {
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR/../src:$PATH"
}


@test "can run our script" {
  main.sh
}
