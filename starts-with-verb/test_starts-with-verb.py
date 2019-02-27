import pytest

import starts_with_verb

def test_starts_with_verb():
    with pytest.raises(AssertionError) as e:
        starts_with_verb.assert_starts_with_verb("Black dog")

    starts_with_verb.assert_starts_with_verb("Don't do it")

    with pytest.raises(AssertionError) as e:
        starts_with_verb.assert_starts_with_verb("Didn't do it")

    with pytest.raises(AssertionError) as e:
        starts_with_verb.assert_starts_with_verb("Plan code works")
