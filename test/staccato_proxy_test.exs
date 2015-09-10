defmodule Staccato.ProxyTest do
  use ExUnit.Case

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "get google.com" do
    response = HTTPotion.get("https://google.com")
    assert response.status_code == 301
  end
end
