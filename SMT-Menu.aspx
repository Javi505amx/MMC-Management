<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SMT-Menu.aspx.cs" Inherits="ManageWO.SMT_Menu" %>

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

    <title>SMT Menu</title>
</head>
<body>
    <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="./Default.aspx">
                <img src="./resources/images2/inv.png" /></a>


            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" title="Toggle navigation" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse d-sm-inline-flex justify-content-between">
                <ul class="navbar-nav flex-grow-1">
                    <li class="nav-item"><a class="nav-link active" runat="server" href="~/SMT-Menu.aspx">SMT</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/PTH-Menu.aspx">PTH</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <main class="contenedor">
    </main>
    <form id="form1" runat="server">
        <div class="cards">
            <div><a class="card btn btn-secondary" href="http://192.168.55.33:1000/WOSMT.aspx"> WO MANAGE</a></div>
            <div><a class="card btn btn-secondary" href="http://192.168.55.33:8081/PopulateForm.aspx">FS IMPORT</a></div>
            <div><a class="card btn btn-secondary" href="http://192.168.55.33/reports/report/SMT%20Validation/FS%20SMT%20Validation">FS EXCEL</a></div>
            <div><a class="card btn btn-secondary" href="http://192.168.55.33:1000/ImportKNSMT.aspx">Kitting Note</a></div>
            <div><a class="card btn btn-secondary" href="http://192.168.55.33:1000/AlternateNP.aspx">Alternos</a></div>
            <div><a class="card btn btn-secondary" href="http://192.168.55.33:1000/DeleteFS.aspx">Borrar FS</a></div>
<%--            <div class="card btn btn-secondary"><a>Borrar KN</a></div>
            <div class="card btn btn-secondary"><a>EDITAR KN</a></div>--%>
<%--            <div class="card btn btn-secondary"><a>Menu 2</a></div>
            <div class="card btn btn-secondary"><a>Menu 2</a></div>
            <div class="card btn btn-secondary"><a>Menu 2</a></div>
            <div class="card btn btn-secondary"><a>Menu 2</a></div>--%>
        </div>
    </form>
</body>
</html>
