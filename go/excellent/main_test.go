package main

import "testing"

func TestEvenOrOdd(t *testing.T) {
	result := EvenOrOdd(10)
	if result != "even" {
		t.Errorf("expected: even, actual: %s", result)
	}
	result := EvenOrOdd(11)
	if result != "odd" {
		t.Errorf("expected: odd, actual: %s", result)
	}
}