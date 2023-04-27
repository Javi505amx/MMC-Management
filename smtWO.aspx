<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="smtWO.aspx.cs" Inherits="ManageWO.smtWO" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="~/resources/images2/icon.ico" rel="shortcut icon" />
    <%--<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous" />--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.min.js"></script>
    <script src="Resources/JS/script.js"></script>
    <link rel="stylesheet" href="https://necolas.github.io/normalize.css/8.0.1/normalize.css" />
    <link rel="stylesheet" href="Resources/CSS/Styles.css" />
    <link rel="stylesheet" href="Resources/CSS/site.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;700&display=swap" rel="stylesheet" />
    <%--TODO: agregar script js   --%>
    <script type="text/javascript">
        function disableBack() { window.history.forward(); }
        setTimeout("disableBack()", 0);
        window.onunload = function () { null };


    </script>


    <title>IT Management WO</title>
</head>
<body>
    <nav class="navbar navbar-fixed-top navbar-expand-sm  navbar-toggleable-sm navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="./Default.aspx">
                <img id="logo" src="./resources/images2/inv.png" /></a>
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" title="Toggle navigation" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse d-sm-inline-flex justify-content-between">
                <ul class="navbar-nav flex-grow-1">
                    <li class="nav-item"><a class="nav-link " runat="server" href="~/SMT-Menu.aspx">GO BACK</a></li>
                    <%--<li class="nav-item"><a class="nav-link" runat="server" href="~/PTH-Menu.aspx">EXIT</a></li>--%>
                </ul>
            </div>
        </div>
    </nav>


    <form id="form1" runat="server">
        <div class="contenedor-wo">
            <div class="content-index">
                <%-- alerta --%>
                <div runat="server" id="alert" visible="false" class=" d-flex align-items-center" role="alert">
                    <span id="AlertIcon" runat="server" class=" flex-shrink-0 me-2" role="img"></span>
                    <asp:Label runat="server" CssClass="fw-bold" ID="alertText" Text="">
                        
                    </asp:Label>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%--<asp:Button ID="Button1" runat="server" Enabled="true" type="submit" Text="BACK" class=" btn btn-outline-primary fw-bold text-white"  />--%>

                <h2 class="">WORK ORDER SMT</h2>

                <%--      <div class="form-row col-md-6">

                      <div class=" col-md-3">
                        <asp:Label runat="server" CssClass="fw-bold">Action to do</asp:Label>
                        <asp:DropDownList runat="server" class="form-control">
                            <asp:ListItem Selected="True" Value="NA"> Choose.. </asp:ListItem>
                            <asp:ListItem Text="Modify" Value="Modify"></asp:ListItem>
                            <asp:ListItem Text="Create" Value="Create"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="input-group mb-3">
                        <span class=" input-group-text bi bi-search" id="basic-addon1"></span>
                        <asp:TextBox runat="server" type="text" class="form-control" placeholder="WorkOrder" aria-label="Username" aria-describedby="basic-addon1"></asp:TextBox>
                        <asp:Button CssClass=" btn btn-dark fw-bold  " runat="server" Text="SEARCH" />
                    </div>
                </div>--%>
                <div class="form-group col-md-0">
                    <asp:Label CssClass="fw-bold" Visible="false" runat="server" for="inputID">ID</asp:Label>

                    <asp:TextBox runat="server" type="text" Visible="false" class="form-control " ID="inputID" aria-describedby="basic-addon1" Enabled="false" placeholder="ID"></asp:TextBox>
                </div>

                <div class="form-row">

                    <div class="form-group col-md-6">
                        <asp:Label CssClass="fw-bold"  runat="server" for="inputWorkOrder">Work Order</asp:Label>
                        <asp:TextBox runat="server" Style="text-transform: uppercase" type="text" class="form-control" ID="inputWorkorder" aria-describedby="basic-addon1" placeholder="WORK ORDER, Model" OnTextChanged="inputWorkorder_TextChanged"></asp:TextBox>

                    </div>

         <%--           <div class="form-group col-md-2">
                        <asp:Label CssClass="fw-bold " ID="label" BorderColor="#f5f5f5" BackColor="#f5f5f5" runat="server" ForeColor="#f5f5f5"> Hola</asp:Label>

                        <asp:Button runat="server" Text="SEARCH" class=" form-control btn btn-outline-dark fw-bold " ID="SearchBtn" OnClick="SearchBtn_Click"></asp:Button>
                    </div>--%>
                </div>
                <div class="form-group col-auto row g-2 ">
                    <div class="form-group col-md-4">
                        <asp:Label runat="server" CssClass="fw-bold">Quantity</asp:Label>
                        <asp:TextBox runat="server" Style="text-transform: uppercase" type="text" class="form-control" ID="inputQty" placeholder="0000"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-8">
                        <asp:Label runat="server" CssClass="fw-bold" for="inputModel">Model</asp:Label>
                        <asp:TextBox runat="server" Style="text-transform: uppercase" type="text" class="form-control" ID="inputModel" placeholder="MODEL (MX1XXXXXXXXXXX)"></asp:TextBox>
                    </div>

                </div>
                <div class="form-group  row g-2">
                    <div class="form-group col-md-6">
                        <asp:Label runat="server" CssClass="fw-bold" for="inputAddress">First QR</asp:Label>
                        <asp:TextBox runat="server" Style="text-transform: uppercase" type="text" class="form-control" ID="inputFirstQR" placeholder="First QR code printed"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-6">
                        <asp:Label runat="server" CssClass="fw-bold">Last QR</asp:Label>
                        <asp:TextBox runat="server" Style="text-transform: uppercase" class="form-control" ID="inputLastQR" placeholder="Last QR code printed"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="buttons">

                    <asp:Button ID="NewBtn" runat="server" type="submit" Text="NEW" class=" btn btn-info fw-bold text-white" OnClick="NewBtn_Click" Visible="true" />
                    <asp:Button ID="SaveBtn" runat="server" type="submit" Text="SAVE" class=" btn btn-success fw-bold" OnClick="SaveBtn_Click" Visible="false" />
                    <asp:Button ID="DeleteBtn" runat="server" type="submit" Text="DELETE" class="btn btn-danger fw-bold" OnClick="DeleteBtn_Click" Visible="false" />
                    <asp:Button ID="ClearBtn" runat="server" type="submit" Text="CLEAR" class="btn btn-warning fw-bold text-white" OnClick="ClearBtn_Click" Visible="false" />
                    <asp:Button ID="EditBtn" runat="server" type="submit" Text="EDIT" class="btn btn-danger fw-bold text-white" OnClick="EditBtn_Click" Visible="false" />


                    <hr />
                </div>
                <div class="form-row">
                    <h2 class="">DATA FILTER</h2>
                    <div class="input-group mb-4">

                        <span class=" input-group-text bi bi-search" id="basic-addon1"></span>
                        <asp:TextBox ID="filterText" Style="text-transform: uppercase"  AutoPostBack="true" OnTextChanged="filterText_TextChanged" runat="server" type="text" class="form-control" placeholder="WorkOrder" aria-label="Username" aria-describedby="basic-addon1"></asp:TextBox>
                        <asp:Button ID="SearchBtn" CssClass=" btn btn-dark fw-bold" OnClick="SearchBtn_Click"  runat="server" Text="SEARCH" />
                        <asp:Button ID="RefreshBtn" CssClass="btn btn-primary fw-bold" runat="server" OnClick="RefreshBtn_Click" Text="REFRESH" />
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-md-12s col-md-offset-1">
                        <div class="form-group">
                            <div class="rounded shadow bg-white table-responsive ">

                                <asp:GridView ID="myTable" OnRowDataBound="myTable_RowDataBound" OnPageIndexChanging="myTable_PageIndexChanging" OnSelectedIndexChanged="myTable_SelectedIndexChanged" HeaderStyle-CssClass="bg-secondary text-white" CssClass="table table-bordered table-condensed table-responsive table-hover small-top-margin" ShowHeaderWhenEmpty="true" runat="server" AutoGenerateColumns="false"  DataKeyNames="WorkOrder" AutoGenerateSelectButton="true"  AllowPaging="True">
                                    <AlternatingRowStyle BackColor="White" />
                                    <RowStyle BackColor="#f5f5f5" />
                                    <SelectedRowStyle BackColor="#669999" Font-Bold="true" ForeColor="White" />
                                    <EmptyDataTemplate>
                                        <div class="text-center">Sin registros</div>
                                    </EmptyDataTemplate>
                                    <Columns>
                                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" InsertVisible="true" SortExpression="ID" />
                                        <asp:BoundField DataField="WorkOrder" HeaderText="WorkOrder" ReadOnly="True" SortExpression="WorkOrder" />
                                        <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model"></asp:BoundField>
                                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity"></asp:BoundField>
                                        <asp:BoundField DataField="InitialSN" HeaderText="InitialSN" SortExpression="InitialSN"></asp:BoundField>
                                        <asp:BoundField DataField="FinalSN" HeaderText="FinalSN" SortExpression="FinalSN"></asp:BoundField>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Right" BackColor="#69757D" CssClass="GridPager" ForeColor="White" />
                                </asp:GridView>
                                <%--<asp:SqlDataSource runat="server" ID="GridWO_data" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT TOP (100) ID, WorkOrder, Model, Quantity, InitialSN, FinalSN FROM WODetails ORDER BY WorkOrder DESC"></asp:SqlDataSource>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr />
        <footer>
            <p>&copy; <%: DateTime.Now.Year %> - Designed for MMC Inventronics</p>
        </footer>
    </form>
</body>
</html>
