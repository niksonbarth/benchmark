defmodule PhoenixBenchWeb.BenchmarkControllerTest do
  use PhoenixBenchWeb.ConnCase

  alias PhoenixBench.Benchs
  alias PhoenixBench.Benchs.Benchmark

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:benchmark) do
    {:ok, benchmark} = Benchs.create_benchmark(@create_attrs)
    benchmark
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all benchs", %{conn: conn} do
      conn = get(conn, Routes.benchmark_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create benchmark" do
    test "renders benchmark when data is valid", %{conn: conn} do
      conn = post(conn, Routes.benchmark_path(conn, :create), benchmark: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.benchmark_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.benchmark_path(conn, :create), benchmark: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update benchmark" do
    setup [:create_benchmark]

    test "renders benchmark when data is valid", %{conn: conn, benchmark: %Benchmark{id: id} = benchmark} do
      conn = put(conn, Routes.benchmark_path(conn, :update, benchmark), benchmark: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.benchmark_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, benchmark: benchmark} do
      conn = put(conn, Routes.benchmark_path(conn, :update, benchmark), benchmark: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete benchmark" do
    setup [:create_benchmark]

    test "deletes chosen benchmark", %{conn: conn, benchmark: benchmark} do
      conn = delete(conn, Routes.benchmark_path(conn, :delete, benchmark))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.benchmark_path(conn, :show, benchmark))
      end
    end
  end

  defp create_benchmark(_) do
    benchmark = fixture(:benchmark)
    {:ok, benchmark: benchmark}
  end
end
