<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FS.aspx.cs" Inherits="ManageWO.FS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="~/resources/images/icon.ico" rel="shortcut icon" />
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
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="Scripts/bootstrap.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;700&display=swap" rel="stylesheet" />
    <%--TODO: agregar script js   --%>
    <script type="text/javascript">
        function disableBack() { window.history.forward(); }
        setTimeout("disableBack()", 0);
        window.onunload = function () { null };

    </script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <title>Feeder Setup</title>

</head>
<body>

    <form id="form1" runat="server">
        <nav class="navbar sticky-top navbar-expand-lg navbar-toggleable-sm navbar-dark bg-dark shadow">
            <div class="container ">
                <a class="navbar-brand m-auto" href="./Default.aspx">
                    <img id="logo" src="./resources/images/inv.png" /></a>
                <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" title="Toggle navigation" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse  d-sm-inline-flex mx-auto ">
                    <ul class="navbar-nav mx-auto">
                        <%--<li class="nav-item"><a class="nav-link  text-white" runat="server" href="~/Default.aspx">Home</a></li>--%>
                        <li class="nav-item">
                            <asp:LinkButton class=" nav-link  text-white" runat="server" ToolTip="Create, Modify & Delete WO" PostBackUrl="~/smtwo.aspx">WO</asp:LinkButton></li>
                        <li class="nav-item">
                            <asp:LinkButton class=" nav-link text-white" runat="server" ToolTip="Upload, Review & Delete KN" PostBackUrl="~/SMTKN.aspx">KN</asp:LinkButton></li>
                        <li class="nav-item active">
                            <asp:LinkButton class=" nav-link  text-white" ToolTip="Upload & Delete SN" runat="server" href="#">FS</asp:LinkButton></li>
                        <li class="nav-item">
                            <asp:LinkButton class=" nav-link text-white" ToolTip="Upload & Delete Alterns" runat="server" PostBackUrl="~/SMTALTERNS.aspx">ALTERNS</asp:LinkButton></li>
                    </ul>
                </div>
            </div>

            <ul class=" navbar-collapse collapse navbar-nav ">
                <li>
                    <asp:LinkButton runat="server" class=" fw-bold btn btn-primary me-md-2  btn-sm" type="button" ID="RegresarBtn" OnClick="RegresarBtn_Click" title="BACK"><span class=" fw-bold bi bi-backspace-fill" ></span></asp:LinkButton>
                    <asp:LinkButton type="button" ID="logoutBtn" runat="server" class="btn btn-danger fw-bold  btn-sm" OnClick="logoutBtn_Click" title="LOGOUT"><span runat="server" class="bi bi-box-arrow-left"></span></asp:LinkButton>
                </li>
            </ul>
        </nav>

        <div class="contenedor-wo ">
            <div class="content-index ">
                <div runat="server" id="alert" visible="false" class=" d-flex align-items-center" role="alert">
                    <span id="AlertIcon" runat="server" class=" flex-shrink-0 me-2" role="img"></span>
                    <asp:Label runat="server" CssClass="fw-bold" ID="alertText" Text="">
                        
                    </asp:Label>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <h2 style="text-align: center;" class="">Feeder Setup Uploaded</h2>
                <hr />

                <div class="form-group">
      <%--              <div class="form-group row g-2">
                        <div class="form-group col-md-6">
                            <asp:Label CssClass="fw-bold form-control label" runat="server">Work Order</asp:Label>
                            <asp:TextBox runat="server" Style="text-transform: uppercase" type="text" class="form-control" ID="inputWorkorder" aria-describedby="basic-addon1" placeholder="WORK ORDER" OnTextChanged="inputWorkorder_TextChanged"></asp:TextBox>


                        </div>

                        <div class="form-group col-md-6">
                            <asp:Label runat="server" CssClass="fw-bold form-control label" for="inputModel">Model</asp:Label>
                            <asp:TextBox runat="server" Style="text-transform: uppercase" type="text" class="form-control" ID="inputModel" placeholder="MODEL (MX9XXXXXXXXXXX)"></asp:TextBox>
                        </div>
                    </div>--%>
                    <br />
                    <div class=" botonera form-group mb-3">
                        <%--<asp:LinkButton ID="NewBtn" OnClick="NewBtn_Click" runat="server" type="submit" Text="NEW" class="boton btn btn-primary " Visible="false"><i class="bi bi-plus-circle-fill"></i> NEW</asp:LinkButton>
                        <asp:LinkButton ID="SaveBtn" runat="server" type="submit" Text="SAVE" class="boton btn btn-success" Visible="false"><i class="bi bi-database-fill-up"></i> SAVE</asp:LinkButton>
                        <asp:LinkButton ID="DeleteBtn" runat="server" type="submit" Text="DELETE" class="boton btn btn-danger " Visible="false"><i class="bi bi-trash3-fill"></i> DELETE</asp:LinkButton>
                        <asp:LinkButton ID="ClearBtn" runat="server" type="submit" class="boton btn btn-warning " Visible="false"><span runat="server" id="icono" class="bi bi-eraser-fill"></span>CLEAR </asp:LinkButton>
                        <asp:LinkButton ID="EditBtn" runat="server" type="submit" Text="EDIT" class="boton btn btn-danger" Visible="false"><i class="bi bi-pencil-square"></i> EDIT</asp:LinkButton>
                        <asp:LinkButton ID="UpdateBtn" runat="server" type="submit" Text="EDIT" class=" boton btn btn-warning" Visible="false"><i class="bi bi-database-fill-check"></i> UPDATE</asp:LinkButton>--%>
                        <button  type="button" class="btn btn-primary fw-bold w-100" visible="true" data-toggle="modal" data-target="#myModal" ><i class="bi bi-plus-circle-fill"></i>  SELECT FEEDER SETUP FILE</button>

                    </div>



                </div>
                <div class="card-body" runat="server">
                       

                <div class="modal fade" id="myModal" tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title fw-bold">Select File</h4>
                                <button type="button" class="btn btn-close" data-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="fw-bold">Choose Excel File</label>
                                            <div class="input-group mb-8">
                                                <div class="custom-file">
                                                    <asp:FileUpload ID="fuData"  CssClass="form-control" runat="server" />
                                                    <label class="custom-file-label fw-bold "></label>
                                                </div>
                                                <label id="filename" class="fw-bold"></label>
                                                <div class="input-group-append">
                                                    <asp:Button Text="UPLOAD" ID="btnUpload" runat="server" CssClass=" fw-bold btn btn-secondary" OnClick="btnUpload_Click" />
                                                </div>
                                            </div>
                                            <asp:Label ID="lblMessage" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">CANCEL</button>
                            </div>
                        </div>
                    </div>
                </div>
                    </div>
                <hr />
                <div class="form-group">
                    <h2 style="text-align: center;" class="">DATA FILTER</h2>
                    <div class="input-group">
                        <asp:LinkButton ID="QueryBtn" Visible="false" CssClass="btn btn-dark fw-bold" OnClick="QueryBtn_Click" runat="server" Text="QUERY"><i class="bi bi-binoculars-fill"></i> QUERY</asp:LinkButton>
                        <%--<span class=" input-group-text bi bi-search" id="basic-addon1"></span>--%>
                        <asp:TextBox ID="filterText" CssClass="form-control" Enabled="false" Style="text-transform: uppercase; width: auto;" AutoPostBack="true" OnTextChanged="filterText_TextChanged" runat="server" type="text" class="form-control" placeholder="WorkOrder, Model" aria-label="Username" aria-describedby="basic-addon1"></asp:TextBox>

                        <asp:LinkButton ID="SearchBtn" Visible="false" CssClass=" btn btn-dark fw-bold" OnClick="SearchBtn_Click" runat="server" Text="SEARCH"><i class="bi bi-search"></i> SEARCH</asp:LinkButton>
                        <asp:LinkButton ID="RefreshBtn" Visible="true" CssClass=" btn btn-primary fw-bold" runat="server" OnClick="RefreshBtn_Click" Text="REFRESH"><i class="bi bi-arrow-clockwise"></i> REFRESH</asp:LinkButton>
                        <asp:LinkButton ID="CancelBtn" Visible="false" CssClass=" btn btn-danger fw-bold" runat="server" OnClick="CancelBtn_Click" Text="CANCEL"><i class="bi bi-x-square-fill"></i> CANCEL</asp:LinkButton>

                    </div>
                    <hr />
                </div>
                <div class="form-row mx-auto">
                    <div class="col-md-12 col-md-offset-1">

                        <div class="rounded shadow bg-white table-responsive">
                            <asp:GridView runat="server" ID="tableFS" HeaderStyle-CssClass="bg-secondary text-white" OnPageIndexChanging="tableFS_PageIndexChanging" OnSelectedIndexChanged="tableFS_SelectedIndexChanged" OnRowCommand="tableFS_RowCommand" OnSelectedIndexChanging="tableFS_SelectedIndexChanging" CssClass="table table-bordered table-condensed table-responsive table-hover small-top-margin" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" OnRowDataBound="tableFS_RowDataBound" DataKeyNames="WorkOrder" AllowPaging="true" HorizontalAlign="Center" GridLines="Horizontal" Width="100%">
                                <AlternatingRowStyle BackColor="White" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <RowStyle BackColor="#f5f5f5" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#00404d" CssClass="opacity" Font-Bold="true" ForeColor="White" />
                                <EmptyDataTemplate>
                                    <div class="text-center">Sin registros</div>
                                </EmptyDataTemplate>
                                <Columns>

                                    <asp:BoundField DataField="WorkOrder" HeaderText="WorkOrder" ReadOnly="True" SortExpression="WorkOrder">
                                        <ItemStyle Width="25%"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model">
                                        <ItemStyle Width="25%"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:ButtonField ButtonType="image" ImageUrl="./Resources/images/icons/download2.png" Text="DOWNLOAD" CommandName="DownloadFS" HeaderText="Download"  />
                                    <asp:ButtonField ButtonType="image" ImageUrl="./Resources/images/icons/delete.jpg" Text="DELETE" CommandName="DeleteFS" HeaderText="Delete" />
<%--                                    <asp:TemplateField HeaderText="Download FS">
        <ItemTemplate>
            <asp:LinkButton ID="FSDownload"  runat="server" ToolTip="Download" CommandName="DownloadFS" ><img src="./Resources/images/icons/download2.png" style="max-width:48px"  /></asp:LinkButton>             
        </ItemTemplate>
</asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete FS">
        <ItemTemplate>
            <asp:LinkButton ID="FSDelete"  runat="server" ToolTip="Delete FS" CommandName="DeleteFS" OnClientClick="return confirm('Are you sure you want to delete this Feeder Setup?');"><img src="./Resources/images/icons/delete.jpg" style="max-width:48px"  /></asp:LinkButton>             
        </ItemTemplate>
</asp:TemplateField>--%>
                      
                                </Columns>

                                <PagerStyle HorizontalAlign="Left" BackColor="#69757D" CssClass="GridPager" />

                            </asp:GridView>
                        </div>

                    </div>
                </div>








            </div>
            <!-- contenedor wo-->
        </div>
        <%--content-wo        --%>
    </form>
</body>
</html>
