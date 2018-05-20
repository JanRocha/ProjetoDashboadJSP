<%@page import="Model.Produto"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ProdutoDAO"%>
<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Cadastro de produtos</h3>
            </div>

            <div class="title_right">
                <div class="pull-right">
                    <div class="input-group">
                        <a href="produtoCadastrar.jsp"><button type="button" class="btn btn-round btn-success">Cadastrar produto</button></a>
                    </div>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Produtos cadastrados</h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">Settings 1</a>
                                </li>
                                <li><a href="#">Settings 2</a>
                                </li>
                            </ul>
                        </li>
                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <%
                        ProdutoDAO pro = new ProdutoDAO();
                        List<Produto> lstpro = pro.selecionar();
                    %>

                    <table id="datatable-responsive" class="table table-striped dt-responsive nowrap" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Descrição</th>
                                <th>Preço de venda</th>
                                <th>Ativo</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 0; i < lstpro.size(); i++) {
                            %>
                            <tr>
                                <td><%  out.print(lstpro.get(i).getId());%></td>
                                <td><%  out.print(lstpro.get(i).getDescricao());%></td>
                                <td><%  out.print(lstpro.get(i).getPrecoVenda());%></td>
                                <td><%  out.print(lstpro.get(i).getAtivo());%></td>
                                <td><a href="produtoCadastrar.jsp?action=update&id=<%= lstpro.get(i).getId()%>">
                                        <i class="fa fa-edit"></i> Editar
                                    </a></td>
                            </tr>
                            <%                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- /page content -->