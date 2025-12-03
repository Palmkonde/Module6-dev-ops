package main

import "testing"

func TestSimpleFactory(t *testing.T) {
	f := SimpleFactory("http://localhost")

	if f.URL != "http://localhost" {
		t.Errorf("feature incorrect, got %s, want: %s ", f.URL, "http://localhost")
	}
}
