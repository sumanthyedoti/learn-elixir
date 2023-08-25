defmodule AnagramTest do
  use ExUnit.Case
  doctest Anagram

  test "calculates anagrams" do
    assert Anagram.anagram?("car", "arc") == true
    assert Anagram.anagram?("restful", "fluster") == true
    assert Anagram.anagram?("funeral", "realfun") == true
    assert Anagram.anagram?("adultery", "truelady") == true
    assert Anagram.anagram?("customers", "storescum") == true
    assert Anagram.anagram?("fortyfive", "overfifty") == true
    assert Anagram.anagram?("fiftyfive", "overfifty") == false
    assert Anagram.anagram?("funeral", "real fun") == false
  end
end
