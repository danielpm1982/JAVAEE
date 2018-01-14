<style>
    body{
        color: blanchedalmond;
        background-color: black;
        text-align: center;
        font-size: 3em;
    }
    img.footer{
        width: 6em;
        height: 2em;
        margin: auto;
        display: block;
    }
    p.footer1{
        font-size: 0.3em;
        font-family: cursive;
        font-style: italic;
        margin-bottom: 1em;
    }
    p.footer2{
        font-size: 0.3em;
        font-family: cursive;
        font-style: italic;
        margin-bottom: 1em;
    }
    footer{
        border: 3px dashed chocolate;
        width: 7em;
        margin: auto;
        margin-bottom: 1em;
    }
</style>

<footer>
    <p class="footer1">${param.nameJSPF}'s WebAddress is: ${param.webAddressJSPF};<br>the email is: ${param.emailAddressJSPF}<br>and the address is: ${param.addressJSPF}</p>
    <img class="footer" src="images/footerImg.jpg" alt="footer" title="footer">
    <p class="footer2">All rights reserved to danielpm1982.com&#174</p>
</footer>
