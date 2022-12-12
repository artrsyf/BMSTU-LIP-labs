<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!--xsl:template говорит о том, что тут будет замена. match показывает, к какой части документа это применимо-->
  <xsl:template match="/">
    <!--Внутри шаблона пишем наше преобразование-->

    <html>

      <head>

        <title>Result</title>

        <style>
          tr, td, th{
            border: 1px solid black;
          }
        </style>

      </head>


      <body>

        <p><xsl:value-of select="hash/message"></xsl:value-of></p>

        <table>

          <thead>

            <tr>

              <th>Number</th>
              <th>Digit</th>

            </tr>

          </thead>

          <!--Цикл-->
          <xsl:for-each select="objects/object">

            <!--Создание переменной-->
            <xsl:variable name="counter" select="position()"/>

            <tbody>

              <tr>

                <td style="border: 2px dolid black">
                  <!--Извлекаем значение из переменной (обратите внимание на $)-->
                  <xsl:value-of select="$counter"></xsl:value-of>
                </td>
                <td>
                  <!--Извлекаем значение из XML-тега-->
                  <xsl:value-of select="element"></xsl:value-of>
                </td>

              </tr>

            </tbody>

          </xsl:for-each>

        </table>

      </body>

    </html>

  </xsl:template>

</xsl:stylesheet>