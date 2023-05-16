<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FS.aspx.cs" Inherits="ManageWO.FS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="~/resources/images/icon.ico" rel="shortcut icon" />
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
                        <li class="nav-item"><asp:LinkButton class=" nav-link active text-white" runat="server" ToolTip="Create, Modify & Delete WO" PostBackUrl="~/PTHWO.aspx">WO</asp:LinkButton></li>
                        <li class="nav-item"><asp:LinkButton class=" nav-link text-white" runat="server" ToolTip="Upload, Review & Delete KN" >KN</asp:LinkButton></li>
                        <li class="nav-item"><asp:LinkButton class=" nav-link text-white" ToolTip="Upload & Delete SN" runat="server" href="~/">FS</asp:LinkButton></li>
                        <li class="nav-item"><asp:LinkButton class=" nav-link text-white" ToolTip="Upload & Delete SN" runat="server" href="~/">ALTERNS</asp:LinkButton></li>
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
                <hr  />
                
                <div class="form-group">
                    <div class="form-group row g-2">
                        <div class="form-group col-md-6">
                        <asp:Label CssClass="fw-bold form-control label" runat="server">Work Order</asp:Label>
                        <asp:TextBox runat="server" Style="text-transform: uppercase" type="text" class="form-control" ID="inputWorkorder" aria-describedby="basic-addon1" placeholder="WORK ORDER" OnTextChanged="inputWorkorder_TextChanged"></asp:TextBox>

                         
                    </div>
                     
                         <div class="form-group col-md-6">
                            <asp:Label runat="server" CssClass="fw-bold form-control label" for="inputModel">Model</asp:Label>
                            <asp:TextBox runat="server" Style="text-transform: uppercase" type="text" class="form-control" ID="inputModel" placeholder="MODEL (MX9XXXXXXXXXXX)"></asp:TextBox>
                        </div>
                    </div>
                     
                         

                </div>
                <hr />
                <div class="form-row mx-auto">
                    <div class="col-md-12 col-md-offset-1">
                       
                            <div class="rounded shadow bg-white table-responsive">
                                <asp:GridView runat="server" ID="tableFS" HeaderStyle-CssClass="bg-secondary text-white" OnPageIndexChanging="tableFS_PageIndexChanging" OnSelectedIndexChanged="tableFS_SelectedIndexChanged" OnRowCommand="tableFS_RowCommand" OnSelectedIndexChanging="tableFS_SelectedIndexChanging" CssClass="table table-bordered table-condensed table-responsive table-hover small-top-margin" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" OnRowDataBound="tableFS_RowDataBound" AutoGenerateSelectButton="false" DataKeyNames="WorkOrder" AllowPaging="true" >
                                     <AlternatingRowStyle BackColor="White" />
                                        <RowStyle BackColor="#f5f5f5" />
                                        <SelectedRowStyle BackColor="#00404d" CssClass="opacity" Font-Bold="true" ForeColor="White" />
                                        <EmptyDataTemplate>
                                            <div class="text-center">Sin registros</div>
                                        </EmptyDataTemplate>
                                        <Columns>
                                            
                                            <asp:BoundField DataField="WorkOrder" HeaderText="WorkOrder" ReadOnly="True" SortExpression="WorkOrder" />
                                            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model"></asp:BoundField>
                                            <asp:ButtonField  ButtonType="Button" Text="DOWNLOAD" CommandName="DownloadFS"  HeaderText="Feeder Setup"/>
<%--                                            <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton CommandArgument='<%# Eval("Value") %>' runat="server" ID="BtnFS" Text="Download" CssClass="btn btn-dark"  OnClick="BtnFS_Click" ></asp:LinkButton>
                                            </ItemTemplate>
                                            </asp:TemplateField>--%>

                                        </Columns>

                                     <PagerStyle HorizontalAlign="Left" BackColor="#69757D" CssClass="GridPager"  />
                                </asp:GridView>
                            </div>
                        
                    </div>
                </div>








            </div><!-- contenedor wo-->
        </div><%--content-wo        --%>


    </form>
</body>
</html>
