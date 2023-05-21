Unit YourLibraryEngine;

Interface

Type

    { бэк }

    TOnModelChanged = Procedure Of Object;

    { записи и списки }

    // Писатель
    TWriter = Record
        Code: Integer;
        Name: String;
        Nationality: String;
    End;

    TPWriters = ^TWriters;

    TWriters = Record
        Writer: TWriter;
        Next: TPWriters;
    End;

    // Книга
    TBook = Record
        Code: Integer;
        Language: String;
        PublicationYear: Integer;
    End;

    TPBooks = ^TBooks;

    TBooks = Record
        Book: TBook;
        Next: TPBooks;
    End;

    // Автор
    TAuthor = Record
        BookCode: Integer;
        WriterCode: Integer;
    End;

    TPAuthors = ^TAuthors;

    TAuthors = Record
        Author: TAuthor;
        Next: TPAuthors;
    End;

    { основной класс }

    TLibrary = Class
    Private
        ListOfWriters: TPWriters;
        ListOfBooks: TPBooks;
        ListOfAuthors: TPAuthors;
        ViewCallBack: TOnModelChanged;
    Public
        Property Writers: TPWriters Read ListOfWriters Write ListOfWriters;
        Property Books: TPBooks Read ListOfBooks Write ListOfBooks;
        Property Authors: TPAuthors Read ListOfAuthors Write ListOfAuthors;
        Property Callback: TOnModelChanged Read ViewCallback Write ViewCallback;
        Procedure SetCallback(ACallback: TOnModelChanged);
        // Function  GetCount: Integer;
        // Procedure AddRec(Const Rec:);
        // Procedure GetRec(Index: Integer; Var Rec: );
        // Procedure SetRec(Index: Integer; Const Rec: );
        // Procedure RemoveRec(Index: Integer);
    End;

Implementation

Procedure TLibrary.SetCallback(ACallback: TOnModelChanged);
Begin
    Callback := ACallback;
End;

End.
