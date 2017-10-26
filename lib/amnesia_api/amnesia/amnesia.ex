defmodule AmnesiaApi.Amnesia do
  @moduledoc """
  The Amnesia context.
  """

  import Ecto.Query, warn: false
  alias AmnesiaApi.Repo

  alias AmnesiaApi.Amnesia.Book

  @doc """
  Returns the list of books.

  ## Examples

      iex> list_books()
      [%Book{}, ...]

  """
  def list_books do
    Repo.all(Book)
  end

  @doc """
  Gets a single book.

  Raises `Ecto.NoResultsError` if the Book does not exist.

  ## Examples

      iex> get_book!(123)
      %Book{}

      iex> get_book!(456)
      ** (Ecto.NoResultsError)

  """
  def get_book!(id), do: Repo.get!(Book, id)

  @doc """
  Creates a book.

  ## Examples

      iex> create_book(%{field: value})
      {:ok, %Book{}}

      iex> create_book(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_book(attrs \\ %{}) do
    %Book{}
    |> Book.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a book.

  ## Examples

      iex> update_book(book, %{field: new_value})
      {:ok, %Book{}}

      iex> update_book(book, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_book(%Book{} = book, attrs) do
    book
    |> Book.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Book.

  ## Examples

      iex> delete_book(book)
      {:ok, %Book{}}

      iex> delete_book(book)
      {:error, %Ecto.Changeset{}}

  """
  def delete_book(%Book{} = book) do
    Repo.delete(book)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book changes.

  ## Examples

      iex> change_book(book)
      %Ecto.Changeset{source: %Book{}}

  """
  def change_book(%Book{} = book) do
    Book.changeset(book, %{})
  end

  alias AmnesiaApi.Amnesia.Author

  @doc """
  Returns the list of authors.

  ## Examples

      iex> list_authors()
      [%Author{}, ...]

  """
  def list_authors do
    Repo.all(Author)
  end

  @doc """
  Gets a single author.

  Raises `Ecto.NoResultsError` if the Author does not exist.

  ## Examples

      iex> get_author!(123)
      %Author{}

      iex> get_author!(456)
      ** (Ecto.NoResultsError)

  """
  def get_author!(id), do: Repo.get!(Author, id)

  @doc """
  Creates a author.

  ## Examples

      iex> create_author(%{field: value})
      {:ok, %Author{}}

      iex> create_author(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_author(attrs \\ %{}) do
    %Author{}
    |> Author.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a author.

  ## Examples

      iex> update_author(author, %{field: new_value})
      {:ok, %Author{}}

      iex> update_author(author, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_author(%Author{} = author, attrs) do
    author
    |> Author.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Author.

  ## Examples

      iex> delete_author(author)
      {:ok, %Author{}}

      iex> delete_author(author)
      {:error, %Ecto.Changeset{}}

  """
  def delete_author(%Author{} = author) do
    Repo.delete(author)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking author changes.

  ## Examples

      iex> change_author(author)
      %Ecto.Changeset{source: %Author{}}

  """
  def change_author(%Author{} = author) do
    Author.changeset(author, %{})
  end

  alias AmnesiaApi.Amnesia.Question

  @doc """
  Returns the list of questions.

  ## Examples

      iex> list_questions()
      [%Question{}, ...]

  """
  def list_questions do
    Repo.all(Question)
  end

  @doc """
  Gets a single question.

  Raises `Ecto.NoResultsError` if the Question does not exist.

  ## Examples

      iex> get_question!(123)
      %Question{}

      iex> get_question!(456)
      ** (Ecto.NoResultsError)

  """
  def get_question!(id), do: Repo.get!(Question, id)

  @doc """
  Creates a question.

  ## Examples

      iex> create_question(%{field: value})
      {:ok, %Question{}}

      iex> create_question(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_question(attrs \\ %{}) do
    %Question{}
    |> Question.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a question.

  ## Examples

      iex> update_question(question, %{field: new_value})
      {:ok, %Question{}}

      iex> update_question(question, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_question(%Question{} = question, attrs) do
    question
    |> Question.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Question.

  ## Examples

      iex> delete_question(question)
      {:ok, %Question{}}

      iex> delete_question(question)
      {:error, %Ecto.Changeset{}}

  """
  def delete_question(%Question{} = question) do
    Repo.delete(question)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking question changes.

  ## Examples

      iex> change_question(question)
      %Ecto.Changeset{source: %Question{}}

  """
  def change_question(%Question{} = question) do
    Question.changeset(question, %{})
  end

  alias AmnesiaApi.Amnesia.Answer

  @doc """
  Returns the list of answers.

  ## Examples

      iex> list_answers()
      [%Answer{}, ...]

  """
  def list_answers do
    Repo.all(Answer)
  end

  @doc """
  Gets a single answer.

  Raises `Ecto.NoResultsError` if the Answer does not exist.

  ## Examples

      iex> get_answer!(123)
      %Answer{}

      iex> get_answer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_answer!(id), do: Repo.get!(Answer, id)

  @doc """
  Creates a answer.

  ## Examples

      iex> create_answer(%{field: value})
      {:ok, %Answer{}}

      iex> create_answer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_answer(attrs \\ %{}) do
    %Answer{}
    |> Answer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a answer.

  ## Examples

      iex> update_answer(answer, %{field: new_value})
      {:ok, %Answer{}}

      iex> update_answer(answer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_answer(%Answer{} = answer, attrs) do
    answer
    |> Answer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Answer.

  ## Examples

      iex> delete_answer(answer)
      {:ok, %Answer{}}

      iex> delete_answer(answer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_answer(%Answer{} = answer) do
    Repo.delete(answer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking answer changes.

  ## Examples

      iex> change_answer(answer)
      %Ecto.Changeset{source: %Answer{}}

  """
  def change_answer(%Answer{} = answer) do
    Answer.changeset(answer, %{})
  end

  alias AmnesiaApi.Amnesia.Chapter

  @doc """
  Returns the list of chapters.

  ## Examples

      iex> list_chapters()
      [%Chapter{}, ...]

  """
  def list_chapters do
    Repo.all(Chapter)
  end

  @doc """
  Gets a single chapter.

  Raises `Ecto.NoResultsError` if the Chapter does not exist.

  ## Examples

      iex> get_chapter!(123)
      %Chapter{}

      iex> get_chapter!(456)
      ** (Ecto.NoResultsError)

  """
  def get_chapter!(id), do: Repo.get!(Chapter, id)

  @doc """
  Creates a chapter.

  ## Examples

      iex> create_chapter(%{field: value})
      {:ok, %Chapter{}}

      iex> create_chapter(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_chapter(attrs \\ %{}) do
    %Chapter{}
    |> Chapter.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a chapter.

  ## Examples

      iex> update_chapter(chapter, %{field: new_value})
      {:ok, %Chapter{}}

      iex> update_chapter(chapter, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_chapter(%Chapter{} = chapter, attrs) do
    chapter
    |> Chapter.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Chapter.

  ## Examples

      iex> delete_chapter(chapter)
      {:ok, %Chapter{}}

      iex> delete_chapter(chapter)
      {:error, %Ecto.Changeset{}}

  """
  def delete_chapter(%Chapter{} = chapter) do
    Repo.delete(chapter)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking chapter changes.

  ## Examples

      iex> change_chapter(chapter)
      %Ecto.Changeset{source: %Chapter{}}

  """
  def change_chapter(%Chapter{} = chapter) do
    Chapter.changeset(chapter, %{})
  end

  alias AmnesiaApi.Amnesia.BookAuthors

  @doc """
  Returns the list of book_authors.

  ## Examples

      iex> list_book_authors()
      [%BookAuthors{}, ...]

  """
  def list_book_authors do
    Repo.all(BookAuthors)
  end

  @doc """
  Gets a single book_authors.

  Raises `Ecto.NoResultsError` if the Book authors does not exist.

  ## Examples

      iex> get_book_authors!(123)
      %BookAuthors{}

      iex> get_book_authors!(456)
      ** (Ecto.NoResultsError)

  """
  def get_book_authors!(id), do: Repo.get!(BookAuthors, id)

  @doc """
  Creates a book_authors.

  ## Examples

      iex> create_book_authors(%{field: value})
      {:ok, %BookAuthors{}}

      iex> create_book_authors(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_book_authors(attrs \\ %{}) do
    %BookAuthors{}
    |> BookAuthors.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a book_authors.

  ## Examples

      iex> update_book_authors(book_authors, %{field: new_value})
      {:ok, %BookAuthors{}}

      iex> update_book_authors(book_authors, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_book_authors(%BookAuthors{} = book_authors, attrs) do
    book_authors
    |> BookAuthors.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a BookAuthors.

  ## Examples

      iex> delete_book_authors(book_authors)
      {:ok, %BookAuthors{}}

      iex> delete_book_authors(book_authors)
      {:error, %Ecto.Changeset{}}

  """
  def delete_book_authors(%BookAuthors{} = book_authors) do
    Repo.delete(book_authors)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book_authors changes.

  ## Examples

      iex> change_book_authors(book_authors)
      %Ecto.Changeset{source: %BookAuthors{}}

  """
  def change_book_authors(%BookAuthors{} = book_authors) do
    BookAuthors.changeset(book_authors, %{})
  end

  alias AmnesiaApi.Amnesia.Section

  @doc """
  Returns the list of sections.

  ## Examples

      iex> list_sections()
      [%Section{}, ...]

  """
  def list_sections do
    Repo.all(Section)
  end

  @doc """
  Gets a single section.

  Raises `Ecto.NoResultsError` if the Section does not exist.

  ## Examples

      iex> get_section!(123)
      %Section{}

      iex> get_section!(456)
      ** (Ecto.NoResultsError)

  """
  def get_section!(id), do: Repo.get!(Section, id)

  @doc """
  Creates a section.

  ## Examples

      iex> create_section(%{field: value})
      {:ok, %Section{}}

      iex> create_section(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_section(attrs \\ %{}) do
    %Section{}
    |> Section.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a section.

  ## Examples

      iex> update_section(section, %{field: new_value})
      {:ok, %Section{}}

      iex> update_section(section, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_section(%Section{} = section, attrs) do
    section
    |> Section.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Section.

  ## Examples

      iex> delete_section(section)
      {:ok, %Section{}}

      iex> delete_section(section)
      {:error, %Ecto.Changeset{}}

  """
  def delete_section(%Section{} = section) do
    Repo.delete(section)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking section changes.

  ## Examples

      iex> change_section(section)
      %Ecto.Changeset{source: %Section{}}

  """
  def change_section(%Section{} = section) do
    Section.changeset(section, %{})
  end

  alias AmnesiaApi.Amnesia.BookSection

  @doc """
  Returns the list of book_sections.

  ## Examples

      iex> list_book_sections()
      [%BookSection{}, ...]

  """
  def list_book_sections do
    Repo.all(BookSection)
  end

  @doc """
  Gets a single book_section.

  Raises `Ecto.NoResultsError` if the Book section does not exist.

  ## Examples

      iex> get_book_section!(123)
      %BookSection{}

      iex> get_book_section!(456)
      ** (Ecto.NoResultsError)

  """
  def get_book_section!(id), do: Repo.get!(BookSection, id)

  @doc """
  Creates a book_section.

  ## Examples

      iex> create_book_section(%{field: value})
      {:ok, %BookSection{}}

      iex> create_book_section(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_book_section(attrs \\ %{}) do
    %BookSection{}
    |> BookSection.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a book_section.

  ## Examples

      iex> update_book_section(book_section, %{field: new_value})
      {:ok, %BookSection{}}

      iex> update_book_section(book_section, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_book_section(%BookSection{} = book_section, attrs) do
    book_section
    |> BookSection.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a BookSection.

  ## Examples

      iex> delete_book_section(book_section)
      {:ok, %BookSection{}}

      iex> delete_book_section(book_section)
      {:error, %Ecto.Changeset{}}

  """
  def delete_book_section(%BookSection{} = book_section) do
    Repo.delete(book_section)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book_section changes.

  ## Examples

      iex> change_book_section(book_section)
      %Ecto.Changeset{source: %BookSection{}}

  """
  def change_book_section(%BookSection{} = book_section) do
    BookSection.changeset(book_section, %{})
  end

  alias AmnesiaApi.Amnesia.SectionQuestions

    @doc """
    Returns the list of section_questions.
    ## Examples
        iex> list_section_questions()
        [%SectionQuestions{}, ...]
    """
    def list_section_questions do
      Repo.all(SectionQuestions)
    end

    @doc """
    Gets a single section_questions.
    Raises `Ecto.NoResultsError` if the Section questions does not exist.
    ## Examples
        iex> get_section_questions!(123)
        %SectionQuestions{}
        iex> get_section_questions!(456)
        ** (Ecto.NoResultsError)
    """
    def get_section_questions!(id), do: Repo.get!(SectionQuestions, id)

    @doc """
    Creates a section_questions.
    ## Examples
        iex> create_section_questions(%{field: value})
        {:ok, %SectionQuestions{}}
        iex> create_section_questions(%{field: bad_value})
        {:error, %Ecto.Changeset{}}
    """
    def create_section_questions(attrs \\ %{}) do
      %SectionQuestions{}
      |> SectionQuestions.changeset(attrs)
      |> Repo.insert()
    end

    @doc """
    Updates a section_questions.
    ## Examples
        iex> update_section_questions(section_questions, %{field: new_value})
        {:ok, %SectionQuestions{}}
        iex> update_section_questions(section_questions, %{field: bad_value})
        {:error, %Ecto.Changeset{}}
    """
    def update_section_questions(%SectionQuestions{} = section_questions, attrs) do
      section_questions
      |> SectionQuestions.changeset(attrs)
      |> Repo.update()
    end

    @doc """
    Deletes a SectionQuestions.
    ## Examples
        iex> delete_section_questions(section_questions)
        {:ok, %SectionQuestions{}}
        iex> delete_section_questions(section_questions)
        {:error, %Ecto.Changeset{}}
    """
    def delete_section_questions(%SectionQuestions{} = section_questions) do
      Repo.delete(section_questions)
    end

    @doc """
    Returns an `%Ecto.Changeset{}` for tracking section_questions changes.
    ## Examples
        iex> change_section_questions(section_questions)
        %Ecto.Changeset{source: %SectionQuestions{}}
    """
    def change_section_questions(%SectionQuestions{} = section_questions) do
      SectionQuestions.changeset(section_questions, %{})
    end

  alias AmnesiaApi.Amnesia.UserBook

  @doc """
  Returns the list of user_books.

  ## Examples

      iex> list_user_books()
      [%UserBook{}, ...]

  """
  def list_user_books do
    Repo.all(UserBook)
  end

  @doc """
  Gets a single user_book.

  Raises `Ecto.NoResultsError` if the User book does not exist.

  ## Examples

      iex> get_user_book!(123)
      %UserBook{}

      iex> get_user_book!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_book!(id), do: Repo.get!(UserBook, id)

  @doc """
  Creates a user_book.

  ## Examples

      iex> create_user_book(%{field: value})
      {:ok, %UserBook{}}

      iex> create_user_book(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_book(attrs \\ %{}) do
    %UserBook{}
    |> UserBook.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_book.

  ## Examples

      iex> update_user_book(user_book, %{field: new_value})
      {:ok, %UserBook{}}

      iex> update_user_book(user_book, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_book(%UserBook{} = user_book, attrs) do
    user_book
    |> UserBook.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a UserBook.

  ## Examples

      iex> delete_user_book(user_book)
      {:ok, %UserBook{}}

      iex> delete_user_book(user_book)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_book(%UserBook{} = user_book) do
    Repo.delete(user_book)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_book changes.

  ## Examples

      iex> change_user_book(user_book)
      %Ecto.Changeset{source: %UserBook{}}

  """
  def change_user_book(%UserBook{} = user_book) do
    UserBook.changeset(user_book, %{})
  end
end
