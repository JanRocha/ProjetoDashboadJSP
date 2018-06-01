<%@page import="java.util.ArrayList"%>
<%@page import="java.util.AbstractList"%>
<%@page import="Model.Produto"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ProdutoDAO"%>
<%@page import="DAO.pedido"%>

 <%          
    String codigo;
    String qtde;
    String descricao;
    String preco;
    codigo = request.getParameter("id");
    qtde = request.getParameter("qtde");    
    descricao = request.getParameter("descricao");    
    preco = request.getParameter("preco"); 
  
   
    try {
            
       ArrayList arr = new ArrayList();
        if (session.getAttribute("itens") != null){
            arr =(ArrayList) session.getAttribute("itens");
            //out.print(arr.toString());
        }
        double dPreco = Double.parseDouble(preco);
        double dqtde= Double.parseDouble(qtde);
        double dTotal= dPreco * dqtde;
        arr.add(descricao+";"+codigo+";"+preco+";"+qtde+";"+dTotal);
        session.setAttribute("itens", arr);
        //out.print(arr.toString());
     } catch (Exception e) {
         out.print(e.getMessage());
     }
        
 
%>

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
                                <form method="POST">
                                    <input type="hidden" name="id" value="<%= lstpro.get(i).getId()%>"/>
                                    <input type="hidden" name="descricao" value="<%= lstpro.get(i).getDescricao()%>"/>
                                    <input type="hidden" name="preco" value="<%= lstpro.get(i).getPrecoVenda()%>"/>
                                    <div class="col-md-4col-sm-4 col-xs-6">
                                    <input type="number" name="qtde" value="1" class="form-control col-md-7 col-xs-12"> 
                                    </div>
                                    <div class="col-md-4 col-sm-4 col-xs-6">
                                    <button id="btn" type="submit" class="btn btn-primary btn-primary">Comprar</button>
                                    </div>
                                </form>
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