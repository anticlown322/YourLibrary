Unit YourLibraryEngine;

Interface

Uses
    System.Classes;

Type

    { классы }

    // Писатель
    TWriter = Class(TObject)
    Private
        WriterCode: Integer;
        WriterName: String;
        WriterNationality: String;
    Public
        Property Code: Integer Read WriterCode Write WriterCode;
        Property Name: String Read WriterName Write WriterName;
        Property Nationality: String Read WriterNationality Write WriterNationality;
        Constructor Create(Const WriterCode: Integer; Const WriterName: String; Const WriterNationality: String);
    End;

    // Книга
    TBook = Class(TObject)
    Private
        BookCode: Integer;
        BookLanguage: String;
        BookName: String;
        BookPublicationYear: Integer;
    Public
        Property Code: Integer Read BookCode Write BookCode;
        Property Language: String Read BookLanguage Write BookLanguage;
        Property Name: String Read BookName Write BookName;
        Property PublicationYear: Integer Read BookPublicationYear Write BookPublicationYear;
        Constructor Create(Const BookCode: Integer; Const BookLanguage: String; Const BookName: String; Const BookPublicationYear: Integer);
    End;

    // Автор
    TAuthor = Class(TObject)
    Private
        AuthorBookCode: Integer;
        AuthorWriterCode: Integer;
    Public
        Property BookCode: Integer Read AuthorBookCode Write AuthorBookCode;
        Property WriterCode: Integer Read AuthorWriterCode Write AuthorWriterCode;
        Constructor Create(Const AuthorBookCode: Integer; Const AuthorWriterCode: Integer);
    End;

    { основной класс }

    TChosenCategory = (Writer, Book, Author);
    TState = (Adding, Deleting, Editing, Searching);

    TLibraryEngine = Class(TObject)
    Private
        ListOfWriters: TList;
        ListOfBooks: TList;
        ListOfAuthors: TList;
        CurrentState: TState;
        CurrentCategory: TChosenCategory;
    Public
        Property Writers: TList Read ListOfWriters Write ListOfWriters;
        Property Books: TList Read ListOfBooks Write ListOfBooks;
        Property Authors: TList Read ListOfAuthors Write ListOfAuthors;
        Property State: TState Read CurrentState Write CurrentState;
        Property Category: TChosenCategory Read CurrentCategory Write CurrentCategory;
    End;

Const
    StateNames: Array [TState] Of String = ('Добавление записи', 'Удаление записи', 'Редактирование записи', 'Поиск');

Implementation

Constructor TWriter.Create(Const WriterCode: Integer; Const WriterName: String; Const WriterNationality: String);
Begin
    Self.WriterCode := WriterCode;
    Self.WriterName := WriterName;
    Self.WriterNationality := WriterNationality;
End;

Constructor TBook.Create(Const BookCode: Integer; Const BookLanguage: String; Const BookName: String; Const BookPublicationYear: Integer);
Begin
    Self.BookCode := BookCode;
    Self.BookLanguage := BookLanguage;
    Self.BookName := BookName;
    Self.BookPublicationYear := BookPublicationYear;
End;

Constructor TAuthor.Create(Const AuthorBookCode: Integer; Const AuthorWriterCode: Integer);
Begin
    Self.AuthorBookCode := AuthorBookCode;
    Self.AuthorWriterCode := AuthorWriterCode;
End;

End.
