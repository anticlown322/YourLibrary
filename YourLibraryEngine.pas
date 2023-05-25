Unit YourLibraryEngine;

Interface

Uses
    System.Classes,
    System.Generics.Collections;

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
        Constructor Create(Const BookCode: Integer; Const BookName: String; Const BookLanguage: String; Const BookPublicationYear: Integer);
    End;

    // Автор
    TAuthor = Class(TObject)
    Private
        AuthorBookCode: Integer;
        AuthorWriterCode: Integer;
    Public
        Property BookCode: Integer Read AuthorBookCode Write AuthorBookCode;
        Property WriterCode: Integer Read AuthorWriterCode Write AuthorWriterCode;
        Constructor Create(Const AuthorWriterCode: Integer; Const AuthorBookCode: Integer);
    End;

    { основной класс }

    TChosenCategory = (Writer, Book, Author);
    TState = (Adding, Deleting, Editing, Searching);

    TLibraryEngine = Class(TObject)
    Private
        ListOfWriters: TObjectList<TObject>;
        ListOfBooks: TObjectList<TObject>;
        ListOfAuthors: TObjectList<TObject>;
        CurrentState: TState;
        CurrentCategory: TChosenCategory;
        CurrentList: TObjectList<TObject>;
    Public
        Property Writers: TObjectList<TObject> Read ListOfWriters Write ListOfWriters;
        Property Books: TObjectList<TObject> Read ListOfBooks Write ListOfBooks;
        Property Authors: TObjectList<TObject> Read ListOfAuthors Write ListOfAuthors;
        Property State: TState Read CurrentState Write CurrentState;
        Property Category: TChosenCategory Read CurrentCategory Write CurrentCategory;
        Property List: TObjectList<TObject> Read CurrentList Write CurrentList;
        Function GetCategoryIndex(): Integer;
        Function List_GetCount(Const List: TObjectList<TObject>): Integer;
        Procedure List_AddItem(Const Obj: TObject; List: TObjectList<TObject>);
        Procedure List_GetItem(Index: Integer; Var Obj: TObject; List: TObjectList<TObject>);
        Procedure List_SetItem(Index: Integer; Const Obj: TObject; List: TObjectList<TObject>);
        Procedure List_RemoveItem(Index: Integer; List: TObjectList<TObject>);
    End;

Const
    StateNames: Array [TState] Of String = ('Добавление записи', 'Удаление записи', 'Редактирование записи', 'Поиск');

Implementation

{ для подклассов }

Constructor TWriter.Create(Const WriterCode: Integer; Const WriterName: String; Const WriterNationality: String);
Begin
    Self.WriterCode := WriterCode;
    Self.WriterName := WriterName;
    Self.WriterNationality := WriterNationality;
End;

Constructor TBook.Create(Const BookCode: Integer; Const BookName: String; Const BookLanguage: String; Const BookPublicationYear: Integer);
Begin
    Self.BookCode := BookCode;
    Self.BookName := BookName;
    Self.BookLanguage := BookLanguage;
    Self.BookPublicationYear := BookPublicationYear;
End;

Constructor TAuthor.Create(Const AuthorWriterCode: Integer; Const AuthorBookCode: Integer);
Begin
    Self.AuthorWriterCode := AuthorWriterCode;
    Self.AuthorBookCode := AuthorBookCode;
End;

{ TLibraryEngine }

Function TLibraryEngine.GetCategoryIndex(): Integer;
Begin
    Case Category Of
        Writer:
            GetCategoryIndex := 0;
        Book:
            GetCategoryIndex := 1;
        Author:
            GetCategoryIndex := 2;
    End;
End;

Function TLibraryEngine.List_GetCount(Const List: TObjectList<TObject>): Integer;
Begin
    List_GetCount := List.Capacity;
End;

Procedure TLibraryEngine.List_AddItem(Const Obj: TObject; List: TObjectList<TObject>);
Begin
    List.Add(Obj);
End;

Procedure TLibraryEngine.List_GetItem(Index: Integer; Var Obj: TObject; List: TObjectList<TObject>);
Begin
    Obj := List.Items[Index];
End;

Procedure TLibraryEngine.List_SetItem(Index: Integer; Const Obj: TObject; List: TObjectList<TObject>);
Begin
    List.Items[Index] := Obj;
End;

Procedure TLibraryEngine.List_RemoveItem(Index: Integer; List: TObjectList<TObject>);
Begin
    List.Delete(Index);
End;

End.
