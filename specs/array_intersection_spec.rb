require "minitest/autorun"
require "minitest/reporters"
require_relative "../lib/array_intersection"

describe "array intersection" do
  describe "basic tests" do
    it "some common elements" do
      array1 = [70, 90, 34, 21, 78, 42]
      array2 = [21, 67, 54, 29, 42, 30]
      expected_intersection = [21, 42]

      intersection(array1, array2).sort!.must_equal expected_intersection
    end

    it "some elements common" do
      array1 = [92, 2, 5, 4, 1, 89, 90]
      array2 = [89, 5, 76, 4, 1, 2]
      expected_intersection = [1, 2, 4, 5, 89]

      intersection(array1, array2).sort!.must_equal expected_intersection
    end

    it "no elements common" do
      array1 = [92, 2, 5, 90]
      array2 = [89, 76, 4, 1]
      expected_intersection = []

      intersection(array1, array2).sort!.must_equal expected_intersection
    end
  end

  describe "edge cases" do
    # if the parameter is an object, check for nil
    it "first parameter nil" do
      array1 = nil
      array2 = [89, 76, 4, 1]
      expected_intersection = []

      intersection(array1, array2).must_equal expected_intersection
    end

    it "second parameter nil" do
      array1 = [92, 2, 5, 90]
      array2 = nil
      expected_intersection = []

      intersection(array1, array2).must_equal expected_intersection
    end

    it "first array empty" do
      array1 = []
      array2 = [70, 90, 34, 21, 78, 42]
      expected_intersection = []

      intersection(array1, array2).sort!.must_equal expected_intersection
    end

    it "second array empty" do
      array1 = [70, 90, 34, 21, 78, 42]
      array2 = []
      expected_intersection = []

      intersection(array1, array2).sort!.must_equal expected_intersection
    end

    it "both arrays empty" do
      array1 = []
      array2 = []
      expected_intersection = []

      intersection(array1, array2).sort!.must_equal expected_intersection
    end

    it "all elements common" do
      array1 = [2, 5, 4, 1, 89]
      array2 = [89, 5, 4, 1, 2]
      expected_intersection = [1, 2, 4, 5, 89]

      intersection(array1, array2).sort!.must_equal expected_intersection
    end
  end
end
