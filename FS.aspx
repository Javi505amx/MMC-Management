<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FS.aspx.cs" Inherits="ManageWO.FS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="~/resources/images2/icon.ico" rel="shortcut icon" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.min.js"></script>
    <script src="Resources/JS/script.js"></script>
    <link rel="stylesheet" href="Resources/CSS/Styles.css" />
    <link rel="stylesheet" href="Resources/CSS/site.css" />

    <title>Feeder Setup</title>
</head>
<body>
    <nav runat="server" class="navbar navbar-expand-sm navbar-toggleable-sm navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" runat="server" href="~/">
                <img runat="server" src="~/resources/images2/inv.png" width="180" />
            </a>
            <%--<a class="nav-link active fw-bold" style="color:rgb(36, 212, 210);" runat="server" href="~/">Feeder Setup actualizados</a>--%>
            <button type="button" runat="server" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" title="Toggle navigation" data-mdb-toggle="collapse"
                data-mdb-target="#navbarCenteredExample"
                aria-controls="navbarCenteredExample" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse <%--d-sm-inline-flex--%> justify-content-center" id="navbarCenteredExample">
                <%--<img runat="server" src="~/resources/images/logo.png" width="250" />--%>
                <div class="navbar-nav mb-2 mb-lg-0">
                    <a class="nav-link active fw-bold text-uppercase" style="color: rgb(255, 102, 0);" runat="server" href="~/">Feeder Setup actualizados</a>
                </div>
                <%--                <ul class="navbar-nav mb-2 mb-lg-0">
                    
                <%--<img runat="server" src="~/resources/images2/inv.png" width="240"/>
                    <li class="nav-item" ></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/Menu.aspx">SMT</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/Contact">PTH</a></li>
                </ul>--%>
            </div>

        </div>
    </nav>
    <form id="form1" runat="server">
            <br />
            <div class="container-md text-center">
                <asp:Label runat="server" CssClass="text-center fw-bold" Text="WORKORDER"></asp:Label><br />
                   <asp:TextBox runat="server" Text=""></asp:TextBox>
            </div>
    </form>
</body>
</html>
