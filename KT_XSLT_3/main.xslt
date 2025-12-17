<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:key name="coursesByTeacher" match="course" use="teachers/teacher"/>
    <xsl:key name="coursesByKeyword" match="course" use="keywords/keyword"/>

    <xsl:template match="/">

        <html>
            <head>
                <title>Наши курсы</title>
            </head>
            <body>
                <h1>Наши курсы</h1>

                <h3>Курсы, которые читает преподаватель Борисов И.О.</h3>
                <ul>
                    <xsl:for-each select="courses/course[keyes='coursesByTeacher' and .//teacher='Борисов И.О.']">
                        <li><xsl:value-of select="title"/></li>
                    </xsl:for-each>
                </ul>

                <h3>Курсы, в которых рассматривается тема XML</h3>
                <ul>
                    <xsl:for-each select="courses/course[keyes='coursesByKeyword' and keywords/keyword='XML']">
                        <li><xsl:value-of select="title"/></li>
                    </xsl:for-each>
                </ul>

                <h3>Курсы, которые читает преподаватель Борисов И.О., и в которых есть тема XSLT </h3>
                <ul>
                    <xsl:for-each select="courses/course[keyes='coursesByTeacher' and .//teacher='Борисов И.О.']">
                        <xsl:if test="keywords/keyword='XSLT'">
                            <li><xsl:value-of select="title"/></li>
                        </xsl:if>
                    </xsl:for-each>
                </ul>

            </body>
        </html>

    </xsl:template>

</xsl:stylesheet>

