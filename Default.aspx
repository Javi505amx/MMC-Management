﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ManageWO.Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="~/resources/images2/icon.ico" rel="shortcut icon" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.min.js"></script>
    <script src="Resources/JS/script.js"></script>
    <link rel="stylesheet" href="https://necolas.github.io/normalize.css/8.0.1/normalize.css" />
    <link rel="stylesheet" href="Resources/CSS/Styles.css" />
    <link rel="stylesheet" href="Resources/CSS/site.css" />
    <%--<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />--%>

    <title>IT Management WO</title>
</head>
<body>
    <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="./Default.aspx">
                <img id="logo" src="./resources/images2/inv.png" /></a>
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" title="Toggle navigation" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse d-sm-inline-flex justify-content-between">
                <ul class="navbar-nav flex-grow-1">
                    <li class="nav-item"><a class="nav-link " runat="server" href="~/SMT-Menu.aspx">SMT</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/PTH-Menu.aspx">PTH</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <form id="form1" runat="server">
               <div class="contenedor">
            <div class="content-index">
                <section class="row" aria-labelledby="aspnetTitle">
                    <h1 id="aspnetTitle">WO CONTROL STATUS REVIEW</h1>
                    <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
                    <p><a href="http://www.asp.net" class="btn btn-primary btn-md">Learn more &raquo;</a></p>
                </section>
                <%--<div class="jumbotron">
                    <p class="text-danger">Responsive GridView in ASP.NET </p>
                    <span class="text-info">Desktop Tablet Phone Different layout </span>
                </div>--%>

            </div>
        </div>
        

    </form>
</body>
</html>