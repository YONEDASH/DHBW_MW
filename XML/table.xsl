<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <style>
html {
    font-family: Arial, system-ui;
}

table {
    border: none;
    background: #d0d0d0;
    border-radius: 25px;
    overflow: hidden;
    border-collapse: collapse;
}

th,
td {
    text-align: center;
    padding: 10px;
}

td:not(:first-child) {
    text-shadow: #fff 1px 1px 0.1rem;
}

td:first-child {
    font-weight: 800;
}

td:nth-child(3) {
    font-weight: 600;
}

th {
    color: #fff;
    background: linear-gradient(#FFE100 10%, #FFC94D);
    margin: 0;
    border: none;
    text-shadow: #000 1px 1px 0.1rem;
}

th:first-child {
    min-width: 80px;
}

th:nth-child(5) {
    min-width: 100px;
}

th:nth-child(6) {
    min-width: 100px;
}

th:first-child,
th:last-child {
    min-width: 100px;
}

td:first-child,
td:nth-child(4) {
    color: white;
    background: linear-gradient(180deg, #a2a2a2 10%, #c7c7c7 60%, #a2a2a2 90%);
    text-shadow: #000 1px 1px 0.1rem;
}

td:nth-child(4) {
    background: linear-gradient(#FFC94D 10%, #FFE100 60%, #FFC94D 90%);
    font-weight: 800;
}

tr:not(:first-child)&gt;* {
    border: #fff solid 0.1px;
}

.bold {
    font-weight: 800;
}
                </style>
            </head>
            <body>
                <h1>Autohaus LUX</h1>
                <h2>Unser Portfolio</h2>
                <p>Sehr geehrter Kunde, hier ist eine aktuelle Liste unserer Fahrzeuge. Melden Sie sich bei uns mit der <span class="bold">Nummer</span> des Fahrzeugs, um eine Probefahrt zu vereinbaren.
Des weiteren können Sie den Preis hier einsehen, falls Sie sich für einen Kauf entscheiden.</p>
                <table>
                    <tr>
                        <th>Nummer</th>
                        <th>Kategorie</th>
                        <th>Jahr</th>
                        <th>Marke</th>
                        <th>Name</th>
                        <th>Preis</th>
                        <th>Fahrwerk</th>
                        <th>Schaltung</th>
                        <th>Gewicht</th>
                        <th>Motor(en)</th>
                        <th>Kraftstoff</th>
                    </tr>
                    <xsl:for-each select="/Portfolio/Auto">
                        <tr>
                            <td>
                                <xsl:value-of select="@id"/>
                            </td>
                            <td>
                                <xsl:value-of select="Kategorie"/>
                            </td>
                            <td>
                                <xsl:value-of select="Erscheinungsjahr"/>
                            </td>
                            <td>
                                <xsl:value-of select="Marke"/>
                            </td>
                            <td>
                                <xsl:value-of select="Name"/>
                            </td>
                            <td>
                                <xsl:value-of select="Preis"/>
                            </td>
                            <td>
                                <xsl:value-of select="Fahrwerk"/>
                            </td>
                            <td>
                                <p>
                                    <xsl:value-of select="Schaltung/Art"/>
                                    <span>, </span>
                                    <br/>
                                    <xsl:value-of select="Schaltung/Gaenge"/>
                                    <span> Gänge</span>
                                </p>
                            </td>
                            <td>
                                <xsl:value-of select="Gewicht"/>
                            </td>
                            <td>
                                <xsl:for-each select="Motoren/Motor">
                                    <xsl:value-of select="Power"/>
                                    <xsl:choose>
                                        <xsl:when test="Bezeichnung">
                                            <xsl:value-of select="Bezeichnung"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                        Motor
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:if test="position() &lt; last()">
                                        <xsl:text> &amp; </xsl:text>
                                    </xsl:if>
                                </xsl:for-each>
                            </td>
                            <td>
                                <xsl:for-each select="Motoren/Motor/Kraftstoff">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position() &lt; last()">
                                        <xsl:text> &amp; </xsl:text>
                                    </xsl:if>
                                </xsl:for-each>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>