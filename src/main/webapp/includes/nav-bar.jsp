<%@ page import="static org.apache.coyote.http11.Constants.a" %>

<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"></a>
        <div class="collapse navbar-collapse" id="navbarScroll">
            <ul class="navbar-nav" style="--bs-scroll-height: 100px;">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="cart.jsp">Cart</a>
                </li>
                <%if(auth != null){%>
                <li class="nav-item">
                            <a class="nav-link" href="orders.jsp">Order</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="log-out">Logout</a>
                        </li>
                <%
                }else{
                %>
                <li class="nav-item nav-item-end">
                            <a class="nav-link" href="login.jsp">Login</a>
                        </li>
                <%
                }
                %>
            </ul>
        </div>
    </div>
</nav>