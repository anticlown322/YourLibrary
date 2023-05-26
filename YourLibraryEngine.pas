Unit YourLibraryEngine;

Interface

Uses
    System.Classes,
    System.Generics.Collections,
    SysUtils;

Type

    { классы и записи }

    // Писатель
    TWriterRec = Record
        WriterCode: Integer;
        WriterName: String[40];
        WriterNationality: String[20];
    End;

    TWriter = Class(TObject)
    Private
        WriterCode: Integer;
        WriterName: String;
        WriterNationality: String;
    Public
        Property Code: Integer Read WriterCode Write WriterCode;
        Property Name: String Read WriterName Write WriterName;
        Property Nationality: String Read WriterNationality Write WriterNationality;
        Procedure Load(Const Rec: TWriterRec); Overload;
        Procedure Store(Var Rec: TWriterRec); Overload;
        Constructor Create(Const WriterCode: Integer; Const WriterName: String; Const WriterNationality: String);
    End;

    // Книга
    TBookRec = Record
        BookCode: Integer;
        BookName: String[40];
        BookLanguage: String[20];
        BookPublicationYear: Integer;
    End;

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
        Procedure Load(Const Rec: TBookRec); Overload;
        Procedure Store(Var Rec: TBookRec); Overload;
        Constructor Create(Const BookCode: Integer; Const BookName: String; Const BookLanguage: String; Const BookPublicationYear: Integer);
    End;

    // Автор
    TAuthorRec = Record
        AuthorBookCode: Integer;
        AuthorWriterCode: Integer;
    End;

    TAuthor = Class(TObject)
    Private
        AuthorBookCode: Integer;
        AuthorWriterCode: Integer;
    Public
        Property BookCode: Integer Read AuthorBookCode Write AuthorBookCode;
        Property WriterCode: Integer Read AuthorWriterCode Write AuthorWriterCode;
        Procedure Load(Const Rec: TAuthorRec); Overload;
        Procedure Store(Var Rec: TAuthorRec); Overload;
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
        Procedure OpenFromFile(Const FileName: String; Var IsCorrect: Boolean);
        Procedure SaveToFile(Const List: TObjectList<TObject>; Const CategoryName: String; Const Ext: String; Var IsCorrect: Boolean);
    End;

Const
    StateNames: Array [TState] Of String = ('Добавление записи', 'Удаление записи', 'Редактирование записи', 'Поиск');

Implementation

{ для подклассов и записей }

Constructor TWriter.Create(Const WriterCode: Integer; Const WriterName: String; Const WriterNationality: String);
Begin
    Self.WriterCode := WriterCode;
    Self.WriterName := WriterName;
    Self.WriterNationality := WriterNationality;
End;

Procedure TWriter.Load(Const Rec: TWriterRec);
Begin
    Self.WriterCode := Rec.WriterCode;
    Self.WriterName := Rec.WriterName;
    Self.WriterNationality := Rec.WriterNationality;
End;

Procedure TWriter.Store(Var Rec: TWriterRec);
Begin
    Rec.WriterCode := Self.WriterCode;
    Rec.WriterName := Self.WriterName;
    Rec.WriterNationality := Self.WriterNationality;
End;

Constructor TBook.Create(Const BookCode: Integer; Const BookName: String; Const BookLanguage: String; Const BookPublicationYear: Integer);
Begin
    Self.BookCode := BookCode;
    Self.BookName := BookName;
    Self.BookLanguage := BookLanguage;
    Self.BookPublicationYear := BookPublicationYear;
End;

Procedure TBook.Load(Const Rec: TBookRec);
Begin
    Self.BookCode := Rec.BookCode;
    Self.BookName := Rec.BookName;
    Self.BookLanguage := Rec.BookLanguage;
    Self.BookPublicationYear := Rec.BookPublicationYear;
End;

Procedure TBook.Store(Var Rec: TBookRec);
Begin
    Rec.BookCode := Self.BookCode;
    Rec.BookName := Self.BookName;
    Rec.BookLanguage := Self.BookLanguage;
    Rec.BookPublicationYear := Self.BookPublicationYear;
End;

Constructor TAuthor.Create(Const AuthorWriterCode: Integer; Const AuthorBookCode: Integer);
Begin
    Self.AuthorWriterCode := AuthorWriterCode;
    Self.AuthorBookCode := AuthorBookCode;
End;

Procedure TAuthor.Load(Const Rec: TAuthorRec);
Begin
    Self.AuthorBookCode := Rec.AuthorBookCode;
    Self.BookCode := Rec.AuthorBookCode;
End;

Procedure TAuthor.Store(Var Rec: TAuthorRec);
Begin
    Rec.AuthorBookCode := Self.AuthorBookCode;
    Rec.AuthorBookCode := Self.BookCode;
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

Procedure TLibraryEngine.OpenFromFile(Const FileName: String; Var IsCorrect: Boolean);
Var
    Obj: TObject;
    I, CategoryIndex: Integer;
Begin
    If ExtractFileExt(FileName) = '.writerdoc' Then
        CategoryIndex := 0;
    If ExtractFileExt(FileName) = '.bookdoc' Then
        CategoryIndex := 1;
    If ExtractFileExt(FileName) = '.authordoc' Then
        CategoryIndex := 2;

    Case CategoryIndex Of
        0:
            Try

            Except
                IsCorrect := False;
            End;
        1:
            Try

            Except
                IsCorrect := False;
            End;
        2:
            Try

            Except
                IsCorrect := False;
            End;
    End;

End;

Procedure TLibraryEngine.SaveToFile(Const List: TObjectList<TObject>; Const CategoryName: String; Const Ext: String; Var IsCorrect: Boolean);
Var
    Path: String;
    Obj: TObject;
    I, CategoryIndex: Integer;
    WriterRec: TWriterRec;
    BookRec: TBookRec;
    AuthorRec: TAuthorRec;
    OutputFileWriters: File Of TWriterRec;
    OutputFileBooks: File Of TBookRec;
    OutputFileAuthors: File Of TAuthorRec;
Begin
    Path := ExtractFileDir(Extractfilepath(Paramstr(0))) + '\' + CategoryName + Ext;
    If CategoryName = 'writers' Then
        CategoryIndex := 0;
    If CategoryName = 'books' Then
        CategoryIndex := 1;
    If CategoryName = 'authors' Then
        CategoryIndex := 2;

    Case CategoryIndex Of
        0:
            Try
                AssignFile(OutputFileWriters, Path);
                Reset(OutputFileWriters);
                Try
                    For I := 0 To List.Count - 1 Do
                    Begin
                        Obj := List[I];
                        (Obj As TWriter).Store(WriterRec);
                        Write(OutputFileWriters, WriterRec);
                    End;
                Finally
                    Close(OutputFileWriters);
                End;
            Except
                IsCorrect := False;
            End;
        1:
            Try
                AssignFile(OutputFileBooks, Path);
                Reset(OutputFileBooks);
                Try
                    For I := 0 To List.Count - 1 Do
                    Begin
                        Obj := List[I];
                        (Obj As TBook).Store(BookRec);
                        Write(OutputFileBooks, BookRec);
                    End;
                Finally
                    Close(OutputFileBooks);
                End;
            Except
                IsCorrect := False;
            End;
        2:
            Try
                AssignFile(OutputFileAuthors, Path);
                Reset(OutputFileAuthors);
                Try
                    For I := 0 To List.Count - 1 Do
                    Begin
                        Obj := List[I];
                        (Obj As TAuthor).Store(AuthorRec);
                        Write(OutputFileAuthors, AuthorRec);
                    End;
                Finally
                    Close(OutputFileAuthors);
                End;
            Except
                IsCorrect := False;
            End;
    End;
End;

End.
