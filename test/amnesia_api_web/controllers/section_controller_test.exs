defmodule AmnesiaApiWeb.SectionControllerTest do
  use AmnesiaApiWeb.ConnCase

  alias AmnesiaApi.Amnesia
  alias AmnesiaApi.Amnesia.Section

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:section) do
    {:ok, section} = Amnesia.create_section(@create_attrs)
    section
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all sections", %{conn: conn} do
      conn = get conn, section_path(conn, :index)
      assert json_response(conn, 200) == []
    end
  end

  describe "create section" do
    test "renders section when data is valid", %{conn: conn} do
      conn = post conn, section_path(conn, :create), section: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)

      conn = get conn, section_path(conn, :show, id)
      assert json_response(conn, 200) == %{
        "id" => id,
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, section_path(conn, :create), section: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update section" do
    setup [:create_section]

    test "renders section when data is valid", %{conn: conn, section: %Section{id: id} = section} do
      conn = put conn, section_path(conn, :update, section), section: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)

      conn = get conn, section_path(conn, :show, id)
      assert json_response(conn, 200) == %{
        "id" => id,
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, section: section} do
      conn = put conn, section_path(conn, :update, section), section: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete section" do
    setup [:create_section]

    test "deletes chosen section", %{conn: conn, section: section} do
      conn = delete conn, section_path(conn, :delete, section)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, section_path(conn, :show, section)
      end
    end
  end

  defp create_section(_) do
    section = fixture(:section)
    {:ok, section: section}
  end
end
