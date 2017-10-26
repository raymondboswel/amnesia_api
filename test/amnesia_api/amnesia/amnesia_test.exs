defmodule AmnesiaApi.AmnesiaTest do
  use AmnesiaApi.DataCase

  alias AmnesiaApi.Amnesia

  describe "books" do
    alias AmnesiaApi.Amnesia.Book

    @valid_attrs %{subtitle: "some subtitle", title: "some title"}
    @update_attrs %{subtitle: "some updated subtitle", title: "some updated title"}
    @invalid_attrs %{subtitle: nil, title: nil}

    def book_fixture(attrs \\ %{}) do
      {:ok, book} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Amnesia.create_book()

      book
    end

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Amnesia.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Amnesia.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      assert {:ok, %Book{} = book} = Amnesia.create_book(@valid_attrs)
      assert book.subtitle == "some subtitle"
      assert book.title == "some title"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Amnesia.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      assert {:ok, book} = Amnesia.update_book(book, @update_attrs)
      assert %Book{} = book
      assert book.subtitle == "some updated subtitle"
      assert book.title == "some updated title"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Amnesia.update_book(book, @invalid_attrs)
      assert book == Amnesia.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Amnesia.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Amnesia.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Amnesia.change_book(book)
    end
  end

  describe "authors" do
    alias AmnesiaApi.Amnesia.Author

    @valid_attrs %{name: "some name", surname: "some surname"}
    @update_attrs %{name: "some updated name", surname: "some updated surname"}
    @invalid_attrs %{name: nil, surname: nil}

    def author_fixture(attrs \\ %{}) do
      {:ok, author} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Amnesia.create_author()

      author
    end

    test "list_authors/0 returns all authors" do
      author = author_fixture()
      assert Amnesia.list_authors() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert Amnesia.get_author!(author.id) == author
    end

    test "create_author/1 with valid data creates a author" do
      assert {:ok, %Author{} = author} = Amnesia.create_author(@valid_attrs)
      assert author.name == "some name"
      assert author.surname == "some surname"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Amnesia.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()
      assert {:ok, author} = Amnesia.update_author(author, @update_attrs)
      assert %Author{} = author
      assert author.name == "some updated name"
      assert author.surname == "some updated surname"
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = Amnesia.update_author(author, @invalid_attrs)
      assert author == Amnesia.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = Amnesia.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> Amnesia.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = Amnesia.change_author(author)
    end
  end

  describe "questions" do
    alias AmnesiaApi.Amnesia.Question

    @valid_attrs %{question: "some question", rating: 120.5}
    @update_attrs %{question: "some updated question", rating: 456.7}
    @invalid_attrs %{question: nil, rating: nil}

    def question_fixture(attrs \\ %{}) do
      {:ok, question} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Amnesia.create_question()

      question
    end

    test "list_questions/0 returns all questions" do
      question = question_fixture()
      assert Amnesia.list_questions() == [question]
    end

    test "get_question!/1 returns the question with given id" do
      question = question_fixture()
      assert Amnesia.get_question!(question.id) == question
    end

    test "create_question/1 with valid data creates a question" do
      assert {:ok, %Question{} = question} = Amnesia.create_question(@valid_attrs)
      assert question.question == "some question"
      assert question.rating == 120.5
    end

    test "create_question/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Amnesia.create_question(@invalid_attrs)
    end

    test "update_question/2 with valid data updates the question" do
      question = question_fixture()
      assert {:ok, question} = Amnesia.update_question(question, @update_attrs)
      assert %Question{} = question
      assert question.question == "some updated question"
      assert question.rating == 456.7
    end

    test "update_question/2 with invalid data returns error changeset" do
      question = question_fixture()
      assert {:error, %Ecto.Changeset{}} = Amnesia.update_question(question, @invalid_attrs)
      assert question == Amnesia.get_question!(question.id)
    end

    test "delete_question/1 deletes the question" do
      question = question_fixture()
      assert {:ok, %Question{}} = Amnesia.delete_question(question)
      assert_raise Ecto.NoResultsError, fn -> Amnesia.get_question!(question.id) end
    end

    test "change_question/1 returns a question changeset" do
      question = question_fixture()
      assert %Ecto.Changeset{} = Amnesia.change_question(question)
    end
  end

  describe "answers" do
    alias AmnesiaApi.Amnesia.Answer

    @valid_attrs %{answer: "some answer", rating: 120.5}
    @update_attrs %{answer: "some updated answer", rating: 456.7}
    @invalid_attrs %{answer: nil, rating: nil}

    def answer_fixture(attrs \\ %{}) do
      {:ok, answer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Amnesia.create_answer()

      answer
    end

    test "list_answers/0 returns all answers" do
      answer = answer_fixture()
      assert Amnesia.list_answers() == [answer]
    end

    test "get_answer!/1 returns the answer with given id" do
      answer = answer_fixture()
      assert Amnesia.get_answer!(answer.id) == answer
    end

    test "create_answer/1 with valid data creates a answer" do
      assert {:ok, %Answer{} = answer} = Amnesia.create_answer(@valid_attrs)
      assert answer.answer == "some answer"
      assert answer.rating == 120.5
    end

    test "create_answer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Amnesia.create_answer(@invalid_attrs)
    end

    test "update_answer/2 with valid data updates the answer" do
      answer = answer_fixture()
      assert {:ok, answer} = Amnesia.update_answer(answer, @update_attrs)
      assert %Answer{} = answer
      assert answer.answer == "some updated answer"
      assert answer.rating == 456.7
    end

    test "update_answer/2 with invalid data returns error changeset" do
      answer = answer_fixture()
      assert {:error, %Ecto.Changeset{}} = Amnesia.update_answer(answer, @invalid_attrs)
      assert answer == Amnesia.get_answer!(answer.id)
    end

    test "delete_answer/1 deletes the answer" do
      answer = answer_fixture()
      assert {:ok, %Answer{}} = Amnesia.delete_answer(answer)
      assert_raise Ecto.NoResultsError, fn -> Amnesia.get_answer!(answer.id) end
    end

    test "change_answer/1 returns a answer changeset" do
      answer = answer_fixture()
      assert %Ecto.Changeset{} = Amnesia.change_answer(answer)
    end
  end

  describe "chapters" do
    alias AmnesiaApi.Amnesia.Chapter

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def chapter_fixture(attrs \\ %{}) do
      {:ok, chapter} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Amnesia.create_chapter()

      chapter
    end

    test "list_chapters/0 returns all chapters" do
      chapter = chapter_fixture()
      assert Amnesia.list_chapters() == [chapter]
    end

    test "get_chapter!/1 returns the chapter with given id" do
      chapter = chapter_fixture()
      assert Amnesia.get_chapter!(chapter.id) == chapter
    end

    test "create_chapter/1 with valid data creates a chapter" do
      assert {:ok, %Chapter{} = chapter} = Amnesia.create_chapter(@valid_attrs)
      assert chapter.name == "some name"
    end

    test "create_chapter/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Amnesia.create_chapter(@invalid_attrs)
    end

    test "update_chapter/2 with valid data updates the chapter" do
      chapter = chapter_fixture()
      assert {:ok, chapter} = Amnesia.update_chapter(chapter, @update_attrs)
      assert %Chapter{} = chapter
      assert chapter.name == "some updated name"
    end

    test "update_chapter/2 with invalid data returns error changeset" do
      chapter = chapter_fixture()
      assert {:error, %Ecto.Changeset{}} = Amnesia.update_chapter(chapter, @invalid_attrs)
      assert chapter == Amnesia.get_chapter!(chapter.id)
    end

    test "delete_chapter/1 deletes the chapter" do
      chapter = chapter_fixture()
      assert {:ok, %Chapter{}} = Amnesia.delete_chapter(chapter)
      assert_raise Ecto.NoResultsError, fn -> Amnesia.get_chapter!(chapter.id) end
    end

    test "change_chapter/1 returns a chapter changeset" do
      chapter = chapter_fixture()
      assert %Ecto.Changeset{} = Amnesia.change_chapter(chapter)
    end
  end

  describe "book_authors" do
    alias AmnesiaApi.Amnesia.BookAuthors

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def book_authors_fixture(attrs \\ %{}) do
      {:ok, book_authors} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Amnesia.create_book_authors()

      book_authors
    end

    test "list_book_authors/0 returns all book_authors" do
      book_authors = book_authors_fixture()
      assert Amnesia.list_book_authors() == [book_authors]
    end

    test "get_book_authors!/1 returns the book_authors with given id" do
      book_authors = book_authors_fixture()
      assert Amnesia.get_book_authors!(book_authors.id) == book_authors
    end

    test "create_book_authors/1 with valid data creates a book_authors" do
      assert {:ok, %BookAuthors{} = book_authors} = Amnesia.create_book_authors(@valid_attrs)
    end

    test "create_book_authors/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Amnesia.create_book_authors(@invalid_attrs)
    end

    test "update_book_authors/2 with valid data updates the book_authors" do
      book_authors = book_authors_fixture()
      assert {:ok, book_authors} = Amnesia.update_book_authors(book_authors, @update_attrs)
      assert %BookAuthors{} = book_authors
    end

    test "update_book_authors/2 with invalid data returns error changeset" do
      book_authors = book_authors_fixture()
      assert {:error, %Ecto.Changeset{}} = Amnesia.update_book_authors(book_authors, @invalid_attrs)
      assert book_authors == Amnesia.get_book_authors!(book_authors.id)
    end

    test "delete_book_authors/1 deletes the book_authors" do
      book_authors = book_authors_fixture()
      assert {:ok, %BookAuthors{}} = Amnesia.delete_book_authors(book_authors)
      assert_raise Ecto.NoResultsError, fn -> Amnesia.get_book_authors!(book_authors.id) end
    end

    test "change_book_authors/1 returns a book_authors changeset" do
      book_authors = book_authors_fixture()
      assert %Ecto.Changeset{} = Amnesia.change_book_authors(book_authors)
    end
  end

  describe "sections" do
    alias AmnesiaApi.Amnesia.Section

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def section_fixture(attrs \\ %{}) do
      {:ok, section} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Amnesia.create_section()

      section
    end

    test "list_sections/0 returns all sections" do
      section = section_fixture()
      assert Amnesia.list_sections() == [section]
    end

    test "get_section!/1 returns the section with given id" do
      section = section_fixture()
      assert Amnesia.get_section!(section.id) == section
    end

    test "create_section/1 with valid data creates a section" do
      assert {:ok, %Section{} = section} = Amnesia.create_section(@valid_attrs)
      assert section.name == "some name"
    end

    test "create_section/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Amnesia.create_section(@invalid_attrs)
    end

    test "update_section/2 with valid data updates the section" do
      section = section_fixture()
      assert {:ok, section} = Amnesia.update_section(section, @update_attrs)
      assert %Section{} = section
      assert section.name == "some updated name"
    end

    test "update_section/2 with invalid data returns error changeset" do
      section = section_fixture()
      assert {:error, %Ecto.Changeset{}} = Amnesia.update_section(section, @invalid_attrs)
      assert section == Amnesia.get_section!(section.id)
    end

    test "delete_section/1 deletes the section" do
      section = section_fixture()
      assert {:ok, %Section{}} = Amnesia.delete_section(section)
      assert_raise Ecto.NoResultsError, fn -> Amnesia.get_section!(section.id) end
    end

    test "change_section/1 returns a section changeset" do
      section = section_fixture()
      assert %Ecto.Changeset{} = Amnesia.change_section(section)
    end
  end

  describe "book_sections" do
    alias AmnesiaApi.Amnesia.BookSection

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def book_section_fixture(attrs \\ %{}) do
      {:ok, book_section} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Amnesia.create_book_section()

      book_section
    end

    test "list_book_sections/0 returns all book_sections" do
      book_section = book_section_fixture()
      assert Amnesia.list_book_sections() == [book_section]
    end

    test "get_book_section!/1 returns the book_section with given id" do
      book_section = book_section_fixture()
      assert Amnesia.get_book_section!(book_section.id) == book_section
    end

    test "create_book_section/1 with valid data creates a book_section" do
      assert {:ok, %BookSection{} = book_section} = Amnesia.create_book_section(@valid_attrs)
    end

    test "create_book_section/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Amnesia.create_book_section(@invalid_attrs)
    end

    test "update_book_section/2 with valid data updates the book_section" do
      book_section = book_section_fixture()
      assert {:ok, book_section} = Amnesia.update_book_section(book_section, @update_attrs)
      assert %BookSection{} = book_section
    end

    test "update_book_section/2 with invalid data returns error changeset" do
      book_section = book_section_fixture()
      assert {:error, %Ecto.Changeset{}} = Amnesia.update_book_section(book_section, @invalid_attrs)
      assert book_section == Amnesia.get_book_section!(book_section.id)
    end

    test "delete_book_section/1 deletes the book_section" do
      book_section = book_section_fixture()
      assert {:ok, %BookSection{}} = Amnesia.delete_book_section(book_section)
      assert_raise Ecto.NoResultsError, fn -> Amnesia.get_book_section!(book_section.id) end
    end

    test "change_book_section/1 returns a book_section changeset" do
      book_section = book_section_fixture()
      assert %Ecto.Changeset{} = Amnesia.change_book_section(book_section)
    end
  end

  describe "user_books" do
    alias AmnesiaApi.Amnesia.UserBook

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def user_book_fixture(attrs \\ %{}) do
      {:ok, user_book} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Amnesia.create_user_book()

      user_book
    end

    test "list_user_books/0 returns all user_books" do
      user_book = user_book_fixture()
      assert Amnesia.list_user_books() == [user_book]
    end

    test "get_user_book!/1 returns the user_book with given id" do
      user_book = user_book_fixture()
      assert Amnesia.get_user_book!(user_book.id) == user_book
    end

    test "create_user_book/1 with valid data creates a user_book" do
      assert {:ok, %UserBook{} = user_book} = Amnesia.create_user_book(@valid_attrs)
    end

    test "create_user_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Amnesia.create_user_book(@invalid_attrs)
    end

    test "update_user_book/2 with valid data updates the user_book" do
      user_book = user_book_fixture()
      assert {:ok, user_book} = Amnesia.update_user_book(user_book, @update_attrs)
      assert %UserBook{} = user_book
    end

    test "update_user_book/2 with invalid data returns error changeset" do
      user_book = user_book_fixture()
      assert {:error, %Ecto.Changeset{}} = Amnesia.update_user_book(user_book, @invalid_attrs)
      assert user_book == Amnesia.get_user_book!(user_book.id)
    end

    test "delete_user_book/1 deletes the user_book" do
      user_book = user_book_fixture()
      assert {:ok, %UserBook{}} = Amnesia.delete_user_book(user_book)
      assert_raise Ecto.NoResultsError, fn -> Amnesia.get_user_book!(user_book.id) end
    end

    test "change_user_book/1 returns a user_book changeset" do
      user_book = user_book_fixture()
      assert %Ecto.Changeset{} = Amnesia.change_user_book(user_book)
    end
  end
end
