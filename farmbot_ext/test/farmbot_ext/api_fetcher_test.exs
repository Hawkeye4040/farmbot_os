defmodule FarmbotExt.APIFetcherTest do
  require Helpers

  use ExUnit.Case, async: false
  use Mimic

  setup :verify_on_exit!

  alias FarmbotExt.APIFetcher

  test "client" do
    Helpers.use_fake_jwt()
    %module{} = APIFetcher.client()
    assert module == Tesla.Client
  end

  test "get_body" do
    Helpers.use_fake_jwt()
    {status, _message} = APIFetcher.get_body!("/nope")
    assert status == :error
  end
end
