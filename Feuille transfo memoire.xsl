<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xi="http://www.w3.org/2001/XInclude"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math" version="3.0">

    <xsl:output method="html"/>

    <xsl:template name="navbar">
        <xsl:element name="nav">
            <xsl:element name="ul">
                <xsl:element name="li">
                    <xsl:element name="a">
                        <xsl:attribute name="target"><xsl:text>_blank</xsl:text></xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:text>Accueil.html</xsl:text>
                        </xsl:attribute>
                        <xsl:text>Accueil</xsl:text>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="li">
                    <xsl:element name="a">
                        <xsl:attribute name="target"><xsl:text>_blank</xsl:text></xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:text>Le corpus.html</xsl:text>
                        </xsl:attribute>
                        <xsl:text>Le corpus</xsl:text>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="li">
                    <xsl:element name="a">
                        <xsl:attribute name="target"><xsl:text>_blank</xsl:text></xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:text>Personnages classés par rôle.html</xsl:text>
                        </xsl:attribute>
                        <xsl:text>Personnages par rôle</xsl:text>
                    </xsl:element>
                </xsl:element>
                
                <xsl:element name="li">
                    <xsl:element name="a">
                        <xsl:attribute name="target"><xsl:text>_blank</xsl:text></xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:text>Personnages classés par type.html</xsl:text>
                        </xsl:attribute>
                        <xsl:text>Personnages par type</xsl:text>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="li">
                    <xsl:element name="a">
                        <xsl:attribute name="target"><xsl:text>_blank</xsl:text></xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:text>Lexique de l'aveuglement.html</xsl:text>
                        </xsl:attribute>
                        <xsl:text>Lexique de l'aveuglement</xsl:text>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="li">
                    <xsl:element name="a">
                        <xsl:attribute name="target"><xsl:text>_blank</xsl:text></xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:text>Causes de l'aveuglement.html</xsl:text>
                        </xsl:attribute>
                        <xsl:text>Causes de l'aveuglement</xsl:text>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="li">
                    <xsl:element name="a">
                        <xsl:attribute name="target"><xsl:text>_blank</xsl:text></xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:text>Conséquences de l'aveuglement.html</xsl:text>
                        </xsl:attribute>
                        <xsl:text>Conséquences de l'aveuglement</xsl:text>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="li">
                    <xsl:element name="a">
                        <xsl:attribute name="target"><xsl:text>_blank</xsl:text></xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:text>Procédés de l'aveuglement.html</xsl:text>
                        </xsl:attribute>
                        <xsl:text>Procédés de l'aveuglement</xsl:text>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>


    <xsl:template match="master">

        <!-- Code qui configure la page du corpus de textes par auteur-->
        <xsl:result-document method="html" href="Le corpus.html">
            <xsl:element name="html">
                <xsl:element name="head">
                    <xsl:element name="title">
                        <xsl:text>L'aveuglement</xsl:text>
                    </xsl:element>
                </xsl:element>

                <xsl:element name="link">
                    <xsl:attribute name="rel">
                        <xsl:text>stylesheet</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="href">
                        <xsl:text>style.css</xsl:text>
                    </xsl:attribute>
                </xsl:element>

                <xsl:element name="body">
                    <xsl:attribute name="class">
                        <xsl:text>corpus</xsl:text>
                    </xsl:attribute>
                    <xsl:call-template name="navbar"/>

                    <xsl:element name="div">
                        <xsl:attribute name="class">
                            <xsl:text>contenu</xsl:text>
                        </xsl:attribute>

                        <xsl:element name="h1">
                            <xsl:attribute name="id">
                                <xsl:text>Sommaire</xsl:text>
                            </xsl:attribute>
                            <xsl:text>Corpus de textes</xsl:text>
                        </xsl:element>

                        <xsl:element name="main">
                            <xsl:element name="ul">
                                <!-- Classement des auteurs par ordre alphabétique -->
                                
                                <xsl:for-each select=".//tei:TEI">
                                    <xsl:sort select=".//tei:author" order="ascending"/>
                                    <!-- Création d'une liste contenant les entrées de mes textes avec un lien renvoyant à son texte -->
                                    <xsl:element name="li">
                                        <xsl:element name="a">
                                            <xsl:attribute name="href">
                                                <xsl:text>#</xsl:text>
                                                <xsl:value-of select="./@xml:id"/>
                                            </xsl:attribute>
                                            <xsl:value-of select=".//tei:author"/>
                                            <xsl:text>, </xsl:text>
                                            <xsl:element name="i">
                                                <xsl:value-of
                                                  select="tei:teiHeader//tei:titleStmt/tei:title"/>
                                            </xsl:element>
                                            <xsl:text>, </xsl:text>
                                            <xsl:value-of
                                                select="tei:teiHeader//tei:sourceDesc//tei:biblScope"
                                            />
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:for-each>
                            </xsl:element>
                        </xsl:element>

                        <!-- Renvoi vers les liens -->
                        <xsl:for-each select="tei:TEI">
                            <div>
                                <xsl:attribute name="id">
                                    <xsl:value-of select="@xml:id"/>
                                </xsl:attribute>

                                <!-- Mise en place de la références des oeuvres-->
                                <h3>
                                    <xsl:value-of select="tei:teiHeader//tei:titleStmt/tei:author"/>
                                    <xsl:text>, </xsl:text>
                                    <xsl:element name="i">
                                        <xsl:value-of
                                            select="tei:teiHeader//tei:titleStmt/tei:title"/>
                                    </xsl:element>
                                    <xsl:text>, </xsl:text>
                                    <xsl:value-of
                                        select="tei:teiHeader//tei:sourceDesc//tei:biblScope"/>
                                </h3>

                                <xsl:for-each select="tei:text/tei:body/tei:div">
                                    <xsl:for-each select="tei:p">
                                        <p>
                                            <xsl:value-of select="."/>
                                        </p>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </div>
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>#Sommaire</xsl:text>
                                </xsl:attribute>
                                <xsl:attribute name="class">
                                    <xsl:text>retour-liste</xsl:text>
                                </xsl:attribute>
                                <xsl:text>↑ Retour au sommaire</xsl:text>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:element>

            </xsl:element>
        </xsl:result-document>

        <!-- Code qui configure la liste par rôle -->

        <xsl:result-document method="html" href="Personnages classés par rôle.html">
            <xsl:element name="html">
                <xsl:element name="head">
                    <xsl:element name="title">
                        <xsl:text>Liste par rôle</xsl:text>
                    </xsl:element>
                </xsl:element>

                <xsl:element name="link">
                    <xsl:attribute name="rel">
                        <xsl:text>stylesheet</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="href">
                        <xsl:text>style.css</xsl:text>
                    </xsl:attribute>
                </xsl:element>

                <xsl:element name="body">
                    <xsl:attribute name="class">
                        <xsl:text>role</xsl:text>
                    </xsl:attribute>
                    <xsl:call-template name="navbar"/>
                    <xsl:element name="div">
                        <xsl:attribute name="class">
                            <xsl:text>contenu</xsl:text>
                        </xsl:attribute>
                        <xsl:element name="h1">
                            <xsl:text>Liste par rôle</xsl:text>
                        </xsl:element>

                        <xsl:for-each-group select=".//tei:persName[@role]" group-by="@role">
                            <xsl:sort select="@role" order="ascending"/>
                           
                            <xsl:element name="details">
                                <xsl:element name="summary">
                                    <xsl:choose>
                                    <xsl:when test="current-grouping-key() = 'blinded'">
                                        <xsl:text>Personnages aveuglés</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="current-grouping-key() = 'actor_of_blindness'">
                                        <xsl:text>Personnages aveuglant</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="current-grouping-key() = 'author'">
                                        <xsl:text>Auteur</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="current-grouping-key() = 'capacity_donor'">
                                        <xsl:text>Donneur de capacité</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="current-grouping-key() = 'creator_of_laws'">
                                        <xsl:text>Créateur des lois divines</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="current-grouping-key() = 'stepmother'">
                                        <xsl:text>Belles-mères d'un personnage aveuglé</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="current-grouping-key() = 'father'">
                                        <xsl:text>Père d'un personnage aveuglé</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="current-grouping-key() = 'future_writers'">
                                        <xsl:text>Tisseuses de l'avenir</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="current-grouping-key() = 'muses'">
                                        <xsl:text>Muses</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="current-grouping-key() = 'mother'">
                                        <xsl:text>Mère d'un personnage aveuglé</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="current-grouping-key() = 'captured'">
                                        <xsl:text>Victime d'enlèvement</xsl:text>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:element>

                            <!-- Liste des personnages du groupe -->
                            <xsl:element name="ul">

                                <xsl:for-each-group select="current-group()" group-by="@nymRef">
                                    <xsl:sort select="@nymRef" order="ascending"/>

                                    <xsl:element name="li">
                                        <xsl:choose> 
                                            <xsl:when test="@nymRef = 'Helen'">
                                                <xsl:text>Hélène</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@nymRef = 'Demeter'">
                                                <xsl:text>Déméter</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@nymRef = 'Hera'">
                                                <xsl:text>Héra</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@nymRef = 'Juno'">
                                                <xsl:text>Junon</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@nymRef = 'deities'">
                                                <xsl:text>Divinités</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@nymRef = 'Homer'">
                                                <xsl:text>Homère</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@nymRef = 'Oedipus'">
                                                <xsl:text>Oedipe</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@nymRef = 'Phineus'">
                                                <xsl:text>Phinée</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@nymRef = 'Phineus_sons'">
                                                <xsl:text>Fils de Phinée</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@nymRef = 'Moirai'">
                                                <xsl:text>Les Moires</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@nymRef = 'stepmother'">
                                                <xsl:text>Belle-mère</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@nymRef = 'Athena'">
                                                <xsl:text>Athéna</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@nymRef = 'Stesichorus'">
                                                <xsl:text>Stésichore</xsl:text>
                                            </xsl:when>
                                            
                                            <xsl:otherwise>
                                                <xsl:value-of select="@nymRef"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        
                                        <xsl:element name="ul">
                                            <xsl:for-each select="current-group()">
                                                <xsl:element name="li">
                                                  <xsl:element name="small">
                                                  <xsl:element name="a">
                                                  <xsl:attribute name="href">
                                                  <xsl:text>Le corpus.html#</xsl:text>
                                                  <xsl:value-of select="ancestor::tei:TEI/@xml:id"/>
                                                  </xsl:attribute>
                                                  <xsl:value-of
                                                  select="ancestor::tei:TEI//tei:titleStmt/tei:author"/>
                                                  <xsl:text>, </xsl:text>
                                                  <xsl:element name="i">
                                                  <xsl:value-of
                                                  select="ancestor::tei:TEI//tei:titleStmt/tei:title"
                                                  />
                                                  </xsl:element>
                                                  <xsl:text>, </xsl:text>
                                                  <xsl:value-of
                                                  select="ancestor::tei:TEI//tei:sourceDesc//tei:biblScope"
                                                  />
                                                  </xsl:element>
                                                  </xsl:element>
                                                </xsl:element>
                                            </xsl:for-each>
                                        </xsl:element>
                                    </xsl:element>


                                </xsl:for-each-group>
                            </xsl:element>
                            </xsl:element>

                        </xsl:for-each-group>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:result-document>

        <!-- Code qui configure la page des personnages classés par type -->
        <xsl:result-document method="html" href="Personnages classés par type.html">
            <xsl:element name="html">
                <xsl:element name="head">
                    <xsl:element name="title">
                        <xsl:text>Liste par type</xsl:text>
                    </xsl:element>
                </xsl:element>

                <xsl:element name="link">
                    <xsl:attribute name="rel">
                        <xsl:text>stylesheet</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="href">
                        <xsl:text>style.css</xsl:text>
                    </xsl:attribute>
                </xsl:element>

                <xsl:element name="body">
                    <xsl:attribute name="class">
                        <xsl:text>type</xsl:text>
                    </xsl:attribute>
                    <xsl:call-template name="navbar"/>
                    <xsl:element name="div">
                        <xsl:attribute name="class">
                            <xsl:text>contenu</xsl:text>
                        </xsl:attribute>
                        <xsl:element name="h1">
                            <xsl:text>Liste par type</xsl:text>
                        </xsl:element>


                        <xsl:for-each-group select=".//tei:persName[@role]" group-by="@type">
                            <xsl:sort select="@type" order="ascending"/>
                            
                            <xsl:element name="h3">
                                <xsl:choose>
                                    <xsl:when test="current-grouping-key() = 'deities'">
                                        <xsl:text>Divinités</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="current-grouping-key() = 'deity_man'">
                                        <xsl:text>Divinité masculine</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="current-grouping-key() = 'deity_woman'">
                                        <xsl:text>Divinité féminine</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="current-grouping-key() = 'deity_women'">
                                        <xsl:text>Divinités féminines</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="current-grouping-key() = 'human_man'">
                                        <xsl:text>Hommes</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="current-grouping-key() = 'human_woman'">
                                        <xsl:text>Femmes</xsl:text>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:element>

                            <!-- Liste des personnages du groupe -->
                            <xsl:element name="ul">

                                <xsl:for-each-group select="current-group()" group-by="@nymRef">
                                    <xsl:sort select="@nymRef" order="ascending"/>

                                    <xsl:element name="li">
                                        <xsl:choose>
                                            <xsl:when test="@nymRef = 'deities'">
                                                <xsl:text>Divinités</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@nymRef = 'Athena'">
                                                <xsl:text>Athéna</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@nymRef = 'Demeter'">
                                                <xsl:text>Déméter</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@nymRef = 'Helen'">
                                                <xsl:text>Hélène</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@nymRef = 'Juno'">
                                                <xsl:text>Junon</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@nymRef = 'Hera'">
                                                <xsl:text>Héra</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@nymRef = 'Moirai'">
                                                <xsl:text>Les Moires</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@nymRef = 'Homer'">
                                                <xsl:text>Homère</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@nymRef = 'Phineus_sons'">
                                                <xsl:text>Fils de Phinée</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@nymRef = 'Phineus'">
                                                <xsl:text>Phinée</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@nymRef = 'Stesichorus'">
                                                <xsl:text>Stésichore</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@nymRef = 'stepmother'">
                                                <xsl:text>Belle-mère</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@nymRef = 'Oedipus'">
                                                <xsl:text>Oedipe</xsl:text>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@nymRef"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <xsl:element name="ul">
                                            <xsl:for-each select="current-group()">
                                                <xsl:element name="li">
                                                  <xsl:element name="small">

                                                  <xsl:element name="a">
                                                  <xsl:attribute name="href">
                                                  <xsl:text>Le corpus.html#</xsl:text>
                                                  <xsl:value-of select="ancestor::tei:TEI/@xml:id"/>
                                                  </xsl:attribute>
                                                  <xsl:value-of
                                                  select="ancestor::tei:TEI//tei:titleStmt/tei:author"/>
                                                  <xsl:text>, </xsl:text>
                                                  <xsl:element name="i">
                                                  <xsl:value-of
                                                  select="ancestor::tei:TEI//tei:titleStmt/tei:title"
                                                  />
                                                  </xsl:element>
                                                  <xsl:text>, </xsl:text>
                                                  <xsl:value-of
                                                  select="ancestor::tei:TEI//tei:sourceDesc//tei:biblScope"
                                                  />
                                                  </xsl:element>
                                                  </xsl:element>
                                                </xsl:element>
                                            </xsl:for-each>
                                        </xsl:element>
                                    </xsl:element>


                                </xsl:for-each-group>
                            </xsl:element>

                        </xsl:for-each-group>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:result-document>
        
        <!-- Code qui configure la page  du lexique de l'aveuglement -->

        <xsl:result-document method="html" href="Lexique de l'aveuglement.html">
            <xsl:element name="html">
                <xsl:element name="head">

                    <xsl:element name="title">
                        <xsl:text>Lexique de l'aveuglement</xsl:text>
                    </xsl:element>

                    <xsl:element name="link">
                        <xsl:attribute name="rel">
                            <xsl:text>stylesheet</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:text>style.css</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:element>

                <xsl:element name="body">
                    <xsl:attribute name="class">
                        <xsl:text>lexique</xsl:text>
                    </xsl:attribute>
                    <xsl:call-template name="navbar"/>
                    <xsl:element name="div">
                        <xsl:attribute name="class">
                            <xsl:text>contenu</xsl:text>
                        </xsl:attribute>
                        <xsl:element name="h1">
                            <xsl:text>Lexique de l'aveuglement</xsl:text>
                        </xsl:element>


                        <xsl:element name="table">
                            <xsl:element name="thead">
                                <xsl:element name="tr">
                                    <xsl:element name="th">
                                        <xsl:text>Racine</xsl:text>
                                    </xsl:element>
                                    <xsl:element name="th">
                                        <xsl:text>Entrée du dictionnaire</xsl:text>
                                    </xsl:element>
                                    <xsl:element name="th">
                                        <xsl:text>Lexique de l'aveuglement</xsl:text>
                                    </xsl:element>
                                    <xsl:element name="th">
                                        <xsl:text>Mot</xsl:text>
                                    </xsl:element>
                                    <xsl:element name="th">
                                        <xsl:text>Nature</xsl:text>
                                    </xsl:element>
                                    <xsl:element name="th">
                                        <xsl:text>Cas, Nombre ou Temps, Personne</xsl:text>
                                    </xsl:element>
                                    <xsl:element name="th">
                                        <xsl:text>Personnage sur lequel porte le terme</xsl:text>
                                    </xsl:element>
                                    <xsl:element name="th">
                                        <xsl:text>Source</xsl:text>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="tbody">
                                <xsl:apply-templates select=".//tei:term[tei:w]">
                                    <xsl:sort
                                        select="replace(normalize-unicode(replace(tei:w[1]/@type, '^#', ''), 'NFD'), '\p{Mn}', '')"
                                        order="ascending" lang="el"/>
                                </xsl:apply-templates>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>


                </xsl:element>
            </xsl:element>
        </xsl:result-document>

        <!-- Code qui configure la page sur les causes de l'aveuglement -->

        <xsl:result-document method="html" href="Causes de l'aveuglement.html">
            <xsl:element name="html">
                <xsl:element name="head">
                    <xsl:element name="title">
                        <xsl:text>Causes de l'aveuglement</xsl:text>
                    </xsl:element>
                </xsl:element>

                <xsl:element name="link">
                    <xsl:attribute name="rel">
                        <xsl:text>stylesheet</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="href">
                        <xsl:text>style.css</xsl:text>
                    </xsl:attribute>
                </xsl:element>

                <xsl:element name="body">
                    <xsl:attribute name="class">
                        <xsl:text>causes</xsl:text>
                    </xsl:attribute>
                    <xsl:call-template name="navbar"/>
                    <xsl:element name="div">
                        <xsl:attribute name="class">
                            <xsl:text>contenu</xsl:text>
                        </xsl:attribute>
                        <xsl:element name="h1">
                            <xsl:text>Causes de l'aveuglement</xsl:text>
                        </xsl:element>

                        <xsl:for-each-group select=".//tei:rs[@type = 'cause_of_blindness']"
                            group-by="@subtype">
                            <xsl:sort select="@subtype" order="ascending"/>

                           
                            <xsl:element name="h3">
                                <xsl:choose>
                                    <xsl:when test="current-grouping-key() = 'deities'">
                                        <xsl:text>Divinités</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="current-grouping-key() = 'light_blindness'">
                                        <xsl:text>Aveuglement dû à la lumière</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="current-grouping-key() = 'punishment'">
                                        <xsl:text>Châtiment</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="current-grouping-key() = 'blinded'">
                                        <xsl:text>Personnages aveuglés</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="current-grouping-key() = 'birth_defect'">
                                        <xsl:text>Aveugle de naissance</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="current-grouping-key() = 'love_of_woman'">
                                        <xsl:text>Venger une femme</xsl:text>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:element>

                            <!-- Références -->
                            
                            <xsl:element name="ul">
                                <xsl:for-each select="current-group()">
                                <!--xsl:for-each-group select="current-group()" group-by="@nymRef">
                                    <xsl:sort select="@nymRef" order="ascending"/>-->
                                    <xsl:element name="li">
                                        
                                        
                                        <xsl:choose>
                                            <xsl:when test="@corresp = 'stepmother'"><xsl:text>Belle-mère</xsl:text></xsl:when>
                                            <xsl:when test="@corresp = 'Demeter'"><xsl:text>Déméter</xsl:text></xsl:when>
                                            <xsl:when test="@corresp = 'Athena'"><xsl:text>Athéna</xsl:text></xsl:when>
                                            <xsl:when test="@corresp = 'Helen'"><xsl:text>Hélène</xsl:text></xsl:when>
                                            <xsl:when test="@corresp = 'Hera'"><xsl:text>Héra</xsl:text></xsl:when>
                                            <xsl:when test="@corresp = 'deities'"><xsl:text>Divinités</xsl:text></xsl:when>
                                            <xsl:when test="@corresp = 'Oedipus'"><xsl:text>Oedipe</xsl:text></xsl:when>
                                            <xsl:when test="@corresp = 'Phineus'"><xsl:text>Phinée</xsl:text></xsl:when>
                                            <xsl:when test="@corresp = 'Homerus'"><xsl:text>Homère</xsl:text></xsl:when>
                                            <xsl:when test="@corresp = 'Achilles'"><xsl:text>Achille</xsl:text></xsl:when>
                                            <xsl:otherwise><xsl:value-of select="@corresp"/></xsl:otherwise>
                                        </xsl:choose>
                                        <xsl:text> envers </xsl:text>
                                        
                                            <xsl:choose>
                                                <xsl:when test="@nymRef = 'Phineus_sons'"><xsl:text> les fils de Phinée</xsl:text></xsl:when>
                                                <xsl:when test="@nymRef = 'Phineus'"><xsl:text>Phinée</xsl:text></xsl:when>
                                                <xsl:when test="@nymRef = 'Stesichorus'"><xsl:text>Stésichore</xsl:text></xsl:when>
                                                <xsl:when test="@nymRef = 'Tiresias'"><xsl:text>Tirésias</xsl:text></xsl:when> 
                                                <xsl:when test="@nymRef = 'Oedipus'"><xsl:text>Oedipe</xsl:text></xsl:when>
                                                <xsl:when test="@nymRef = 'Homerus'"><xsl:text>Homère</xsl:text></xsl:when>
                                                <xsl:when test="@nymRef = 'Achilles'"><xsl:text>Achille</xsl:text></xsl:when>
                                                <xsl:otherwise><xsl:value-of select="@nymRef"/></xsl:otherwise>
                                            </xsl:choose>
                                            
                                        
                                        <!-- Référence bibliographique avec puce et indentation -->
                                        <xsl:element name="ul">
                                            <xsl:element name="li">
                                                <xsl:element name="small">
                                                    <xsl:element name="a">
                                                        <xsl:attribute name="href">
                                                            <xsl:text>Le corpus.html#</xsl:text>
                                                            <xsl:value-of select="ancestor::tei:TEI/@xml:id"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of select="ancestor::tei:TEI//tei:titleStmt/tei:author"/>
                                                        <xsl:text>, </xsl:text>
                                                        <xsl:element name="i">
                                                            <xsl:value-of select="ancestor::tei:TEI//tei:titleStmt/tei:title"/>
                                                        </xsl:element>
                                                        <xsl:text>, </xsl:text>
                                                        <xsl:value-of select="ancestor::tei:TEI//tei:sourceDesc//tei:biblScope"/>
                                                    </xsl:element>
                                                </xsl:element>
                                            </xsl:element>
                                        </xsl:element>
                                        
                                    </xsl:element>
                                </xsl:for-each>
                            </xsl:element>
                            
                        </xsl:for-each-group>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:result-document>
        
        <!-- Code qui configure les conséquences de l'aveuglement-->
        <xsl:result-document method="html" href="Conséquences de l'aveuglement.html">
            <xsl:element name="html">
                <xsl:element name="head">
                    <xsl:element name="title">
                        <xsl:text>Conséquences de l'aveuglement</xsl:text>
                    </xsl:element>
                </xsl:element>
                
                <xsl:element name="link">
                    <xsl:attribute name="rel">
                        <xsl:text>stylesheet</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="href">
                        <xsl:text>style.css</xsl:text>
                    </xsl:attribute>
                </xsl:element>
                
                <xsl:element name="body">
                    <xsl:attribute name="class">
                        <xsl:text>consequence</xsl:text>
                    </xsl:attribute>
                    <xsl:call-template name="navbar"/>
                    <xsl:element name="div">
                        <xsl:attribute name="class">
                            <xsl:text>contenu</xsl:text>
                        </xsl:attribute>
                        <xsl:element name="h1">
                            <xsl:text>Conséquences de l'aveuglement</xsl:text>
                        </xsl:element>
                        
                        <xsl:for-each-group select=".//tei:rs[@type = 'consequence_of_blindness']"
                            group-by="@subtype">
                            <xsl:sort select="@subtype" order="ascending"/>
                            
                            
                            
                            <xsl:element name="h3">
                                <xsl:choose>
                                    <xsl:when test="current-grouping-key() = 'forget_practice'">
                                        <xsl:text>Privation de capacités</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="current-grouping-key() = 'mutism'">
                                        <xsl:text>Mutisme</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="current-grouping-key() = 'fall'">
                                        <xsl:text>Perte d'équilibre</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="current-grouping-key() = 'read_future'">
                                        <xsl:text>Don de voir l'avenir</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="current-grouping-key() = 'poetry'">
                                        <xsl:text>Don de poésie</xsl:text>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:element>
                            
                            <xsl:element name="ul">
                                <xsl:for-each-group select="current-group()" group-by="@corresp">
                                    <xsl:sort select="@corresp" order="ascending"/>
                                    
                                    <xsl:element name="li">
                                        <xsl:choose>
                                            <xsl:when test="@corresp = 'Phineus'">
                                                <xsl:text>Phinée</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@corresp = 'Homerus'">
                                                <xsl:text>Homère</xsl:text>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@corresp"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        
                                        <!-- Références -->
                                        <xsl:element name="ul">
                                            <xsl:for-each select="current-group()">
                                                <xsl:element name="li">                                                    
                                                    <xsl:element name="small">
                                                        <xsl:element name="a">
                                                            <xsl:attribute name="href">
                                                                <xsl:text>Le corpus.html#</xsl:text>
                                                                <xsl:value-of select="ancestor::tei:TEI/@xml:id"/>
                                                            </xsl:attribute>
                                                            <xsl:value-of
                                                                select="ancestor::tei:TEI//tei:titleStmt/tei:author"/>
                                                            <xsl:text>, </xsl:text>
                                                            <xsl:element name="i">
                                                                <xsl:value-of
                                                                    select="ancestor::tei:TEI//tei:titleStmt/tei:title"
                                                                />
                                                            </xsl:element>
                                                            <xsl:text>, </xsl:text>
                                                            <xsl:value-of
                                                                select="ancestor::tei:TEI//tei:sourceDesc//tei:biblScope"
                                                            />
                                                        </xsl:element>
                                                    </xsl:element>
                                                </xsl:element>
                                            </xsl:for-each>
                                        </xsl:element>
                                        
                                    </xsl:element>
                                </xsl:for-each-group>
                            </xsl:element>
                            
                        </xsl:for-each-group>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:result-document>
        
        <!-- Code qui configure les procédés de l'aveuglement -->
        
        <xsl:result-document method="html" href="Procédés de l'aveuglement.html">
            <xsl:element name="html">
                <xsl:element name="head">
                    <xsl:element name="title">
                        <xsl:text>Procédés de l'aveuglement</xsl:text>
                    </xsl:element>
                </xsl:element>
                
                <xsl:element name="link">
                    <xsl:attribute name="rel">
                        <xsl:text>stylesheet</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="href">
                        <xsl:text>style.css</xsl:text>
                    </xsl:attribute>
                </xsl:element>
                
                <xsl:element name="body">
                    <xsl:attribute name="class">
                        <xsl:text>procede</xsl:text>
                    </xsl:attribute>
                    <xsl:call-template name="navbar"/>
                    <xsl:element name="div">
                        <xsl:attribute name="class">
                            <xsl:text>contenu</xsl:text>
                        </xsl:attribute>
                        <xsl:element name="h1">
                            <xsl:text>Procédés de l'aveuglement</xsl:text>
                        </xsl:element>
                        
                        <xsl:for-each-group select=".//tei:rs[@type = 'process']"
                            group-by="@subtype">
                            <xsl:sort select="@subtype" order="ascending"/>
                            
                            
                            <xsl:element name="h3">
                                <xsl:choose>
                                    <xsl:when test="current-grouping-key() = 'hands'">
                                        <xsl:text>Mains</xsl:text>
                                    </xsl:when>
                                    
                                    <xsl:when test="current-grouping-key() = 'fall'">
                                        <xsl:text>Perte d'équilibre</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="current-grouping-key() = 'read_future'">
                                        <xsl:text>Voir l'avenir</xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="@subtype"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:element>
                            
                            <xsl:element name="ul">
                                <xsl:for-each-group select="current-group()" group-by="@corresp">
                                    <xsl:sort select="@corresp" order="ascending"/>
                                    
                                    <xsl:element name="li">
                                        <xsl:choose>
                                            <xsl:when test="@corresp = 'Phineus'">
                                                <xsl:text>Phinée</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@corresp = 'stepmother'">
                                                <xsl:text>Belle-mère</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@corresp = 'Oedipus'">
                                                <xsl:text>Oedipe</xsl:text>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@corresp"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        
                                        <!-- Références -->
                                        <xsl:element name="ul">
                                            <xsl:for-each select="current-group()">
                                                <xsl:element name="li">                                                    
                                                    <xsl:element name="small">
                                                        <xsl:element name="a">
                                                            <xsl:attribute name="href">
                                                                <xsl:text>Le corpus.html#</xsl:text>
                                                                <xsl:value-of select="ancestor::tei:TEI/@xml:id"/>
                                                            </xsl:attribute>
                                                            <xsl:value-of
                                                                select="ancestor::tei:TEI//tei:titleStmt/tei:author"/>
                                                            <xsl:text>, </xsl:text>
                                                            <xsl:element name="i">
                                                                <xsl:value-of
                                                                    select="ancestor::tei:TEI//tei:titleStmt/tei:title"
                                                                />
                                                            </xsl:element>
                                                            <xsl:text>, </xsl:text>
                                                            <xsl:value-of
                                                                select="ancestor::tei:TEI//tei:sourceDesc//tei:biblScope"
                                                            />
                                                        </xsl:element>
                                                    </xsl:element>
                                                </xsl:element>
                                            </xsl:for-each>
                                        </xsl:element>
                                        
                                    </xsl:element>
                                </xsl:for-each-group>
                            </xsl:element>
                            
                        </xsl:for-each-group>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:result-document>
        
        <!-- Code qui configure la page d'accueil -->

        <xsl:result-document method="html" href="Accueil.html">
            <xsl:element name="html">
                <xsl:element name="head">
                    <xsl:element name="title">
                        <xsl:text>Accueil</xsl:text>
                    </xsl:element>
                </xsl:element>

                <xsl:element name="link">
                    <xsl:attribute name="rel">
                        <xsl:text>stylesheet</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="href">
                        <xsl:text>style.css</xsl:text>
                    </xsl:attribute>
                </xsl:element>

                <xsl:element name="body">
                    <xsl:attribute name="class">
                        <xsl:text>accueil</xsl:text>
                    </xsl:attribute>
                    <xsl:call-template name="navbar"/>
                    <xsl:element name="div">
                        <xsl:attribute name="class">
                            <xsl:text>contenu</xsl:text>
                        </xsl:attribute>

                        <xsl:element name="h1">
                            <xsl:text>L'aveuglement dans l'Antiquité</xsl:text>
                        </xsl:element>


                        <xsl:element name="main">

                            <xsl:element name="section">
                                <h3>Contexte et origine du projet</h3>
                                <xsl:element name="div">
                                    <xsl:attribute name="class">
                                        <xsl:text>container</xsl:text>
                                    </xsl:attribute>

                                    <xsl:text>Dans le cadre de mon double Master Mondes Anciens et Humanités Numériques, il est proposé un traitement numérique du corpus de ce mémoire. Il a pour but d’enrichir l’analyse textuelle en permettant d’extraire certaines informations clefs directement depuis les textes étudiés afin d’en proposer une mise en forme pratique, qui met en valeur la singularité du corpus. </xsl:text>
                                </xsl:element>
                            </xsl:element>

                            <xsl:element name="section">
                                <h3>Le corpus</h3>
                                <xsl:element name="div">
                                    <xsl:attribute name="class">
                                        <xsl:text>container</xsl:text>
                                    </xsl:attribute>
                                    <xsl:text>Afin que l’étude numérique que je présente soit représentative sans saturer l’analyse, le corpus encodé va se focaliser précisément sur les textes qui traitent de scènes ou de récits étiologiques d’aveuglement. Le but était de cibler les personnages caractéristiques de l’aveuglement, ainsi que les procédés et les situations des scènes. Dans cette logique, les textes relevant de la bibliographie secondaire, comme les textes théoriques ou les critiques n’ont pas été retenus pour l’encodage textuel. Ainsi, nous disposons de ??? textes répertoriés afin de visualiser au mieux les schémas récurrents ou les τόποι des scènes d’aveuglement telles qu’elles ont pu être conservées dans la littérature antique.
                                       </xsl:text>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:result-document>
        
    </xsl:template>

    <!-- Template pour les <term> contenant des <w> dans la partie vocabulaire-->
    <xsl:template match="tei:term[tei:w]">
        <xsl:variable name="nb-w" select="count(tei:w)"/>
        <xsl:for-each select="tei:w">
            <xsl:element name="tr">
                <xsl:element name="td">
                    <xsl:choose>
                        <xsl:when test="starts-with(@type, '#')">
                            <xsl:value-of select="substring(@type, 2)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="@type"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:element>
                <xsl:element name="td">
                    <xsl:choose>
                        <xsl:when test="starts-with(@lemma, '#')">
                            <xsl:value-of select="substring(@lemma, 2)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="@lemma"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:element>
                <xsl:if test="position() = 1">
                    <xsl:element name="td">
                        <xsl:attribute name="class">term-cell</xsl:attribute>
                        <xsl:attribute name="rowspan">
                            <xsl:value-of select="$nb-w"/>
                        </xsl:attribute>
                        <xsl:value-of select="normalize-space(..)"/>
                    </xsl:element>
                </xsl:if>
                <xsl:element name="td">
                    <xsl:value-of select="normalize-space(.)"/>
                </xsl:element>
                <xsl:element name="td">
                    <xsl:value-of select="@pos"/>
                </xsl:element>
                <xsl:element name="td">
                    <xsl:value-of select="@ana"/>
                </xsl:element>
                <xsl:element name="td">
                    <xsl:value-of select="@corresp"/>
                </xsl:element>
                <xsl:element name="td">
                    <xsl:element name="a">
                        <xsl:attribute name="href">
                            <xsl:text>Le corpus.html#</xsl:text>
                            <xsl:value-of select="ancestor::tei:TEI/@xml:id"/>
                        </xsl:attribute>
                        <xsl:attribute name="target">
                            <xsl:text>_blank</xsl:text>
                        </xsl:attribute>
                        <xsl:value-of select="ancestor::tei:TEI//tei:titleStmt/tei:author"/>
                        <xsl:text>, </xsl:text>
                        <xsl:element name="i">
                            <xsl:value-of select="ancestor::tei:TEI//tei:titleStmt/tei:title"/>
                        </xsl:element>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="ancestor::tei:TEI//tei:sourceDesc//tei:biblScope"/>
                        <!-- <xsl:value-of select="../preceding-sibling::tei:lb[1]/@n"/>-->
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
