<%@page import="Model.Produto"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ProdutoDAO"%>
<!-- page content -->
<div class="right_col"role="main">
    <div class="">
        <div class="page-title">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <h3>Produtos disponiveis</h3>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="row">
                        <%
                        ProdutoDAO pro = new ProdutoDAO();
                        List<Produto> lstpro = pro.selecionar();
                        
                        for (int i = 0; i < lstpro.size(); i++) {                           
                        %>
                        <div class="col-md-3 col-sm-3 col-xs-3">
                            <div class="x_panel border-dark colorpicker-alpha">
                                <p>Descrição:</p>                              
                                <h2> <% out.print(lstpro.get(i).getDescricao());%></h2>
                                <h2>Preço <% out.print(lstpro.get(i).getPrecoVenda());%></h2>
                               <button id="btn-continue" type="button" class="btn btn-primary btn-block btn btn-primary">Comprar</button>
                            </div>
                        </div>
                        <%}
                        %>                         
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->