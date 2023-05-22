Unit YourLibraryEngine;

Interface

Uses
    System.Classes;

Type

    { классы и списки }

    // ѕисатель

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

    //  нига
    TBook = Class(TObject)
    Private
        BookCode: Integer;
        BookLanguage: String;
        BookPublicationYear: Integer;
    Public
        Property Code: Integer Read BookCode Write BookCode;
        Property Language: String Read BookLanguage Write BookLanguage;
        Property PublicationYear: Integer Read BookPublicationYear Write BookPublicationYear;
        Constructor Create(Const BookCode: Integer; Const BookLanguage: String; Const BookPublicationYear: Integer);
    End;

    // јвтор
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

    TLibraryEngine = Class(TObject)
    Private
        ListOfWriters: TList;
        ListOfBooks: TList;
        ListOfAuthors: TList;
    Public
        Property Writers: TList Read ListOfWriters Write ListOfWriters;
        Property Books: TList Read ListOfBooks Write ListOfBooks;
        Property Authors: TList Read ListOfAuthors Write ListOfAuthors;
    End;

Implementation

Constructor TWriter.Create(Const WriterCode: Integer; Const WriterName: String; Const WriterNationality: String);
Begin
    Self.WriterCode := WriterCode;
    Self.WriterName := WriterName;
    Self.WriterNationality := WriterNationality;
End;

Constructor TBook.Create(Const BookCode: Integer; Const BookLanguage: String; Const BookPublicationYear: Integer);
Begin
    Self.BookCode := BookCode;
    Self.BookLanguage := BookLanguage;
    Self.BookPublicationYear := BookPublicationYear;
End;

Constructor TAuthor.Create(Const AuthorBookCode: Integer; Const AuthorWriterCode: Integer);
Begin
    Self.AuthorBookCode := AuthorBookCode;
    Self.AuthorWriterCode := AuthorWriterCode;
End;

End.
