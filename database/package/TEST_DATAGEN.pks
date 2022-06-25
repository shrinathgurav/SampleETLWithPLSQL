CREATE OR REPLACE PACKAGE UTPLSQL.TEST_DATAGEN
AS
    /******************************************************************************
       NAME:            DATA_GEN
       PURPOSE:      Package to provide real-world random data generation
       PRODUCT:     TOAD for Oracle
       AUTHOR:       Quest Software, Inc.

    ******************************************************************************/

    -- Returns a random date
    FUNCTION RandomDate (AMin          IN NUMBER,
                         AMax          IN NUMBER,
                         NullPercent   IN NUMBER)
        RETURN DATE;

    -- Returns a random fixed-length integer
    FUNCTION RandomFixedInteger (MaxLength IN NUMBER, NullPercent IN NUMBER)
        RETURN VARCHAR2;

    -- Returns a random account number
    FUNCTION AccountNumber (Format        IN CHAR,
                            ALength       IN NUMBER,
                            NullPercent   IN NUMBER)
        /*  Format values:
            - 'a', 'A' : Alpha only
            - 'n', 'N' : Numeric only
            - 'x', 'x' : Mixed (Alpha-numeric) */
        RETURN VARCHAR2;

    -- Returns a random number
    FUNCTION RandomFloat (AMin          IN NUMBER,
                          AMax          IN NUMBER,
                          NullPercent   IN NUMBER)
        RETURN NUMBER;

    -- Returns a random integer
    FUNCTION RandomInteger (AMin          IN INTEGER,
                            AMax          IN INTEGER,
                            NullPercent   IN NUMBER)
        RETURN INTEGER;

    -- Returns a random ANSI string
    FUNCTION RandomString (opt           IN CHAR,
                           AMin          IN NUMBER,
                           AMax          IN NUMBER,
                           NullPercent   IN NUMBER)
        /* Opt values:
           - 'a','A'  :  Alpha characters only (mixed case)
           - 'l','L'  :  Lowercase alpha characters (only)
           - 'p','P'  :  Any printable characters
           - 'u','U'  :  Uppercase alpha characters (only)
           - 'x','X'  :  Alpha-numeric characters (upper) */
        RETURN VARCHAR2;

    -- Returns a random Unicode string
    FUNCTION UnicodeString (AMin             NUMBER,
                            AMax             NUMBER,
                            ALen             NUMBER,
                            AMaxBytes        NUMBER,
                            NullPercent   IN NUMBER)
        RETURN VARCHAR2;

    -- Returns a random airport code
    FUNCTION AirportCode (Format        IN CHAR,
                          MaxLength     IN NUMBER,
                          NullPercent   IN NUMBER)
        /* Format values:
           - 'c', 'C' : Airport code only
           - 'f', 'F' : Full airport code and location */
        RETURN VARCHAR2;

    -- Returns a random company name
    FUNCTION CompanyName (MaxLength IN NUMBER, NullPercent IN NUMBER)
        RETURN VARCHAR2;

    -- Returns a random continent
    FUNCTION Continent (MaxLength IN NUMBER, NullPercent IN NUMBER)
        RETURN VARCHAR2;

    -- Returns a random country
    FUNCTION Country (MaxLength IN NUMBER, NullPercent IN NUMBER)
        RETURN VARCHAR2;

    -- Returns a random country code
    FUNCTION CountryCode (ALength IN NUMBER, NullPercent IN NUMBER)
        RETURN VARCHAR2;

    -- Returns a random Department
    FUNCTION Department (MaxLength IN NUMBER, NullPercent IN NUMBER)
        RETURN VARCHAR2;

    -- Returns a random Email
    FUNCTION Email (MaxLength IN NUMBER, NullPercent IN NUMBER)
        RETURN VARCHAR2;

    -- Returns a random first name
    FUNCTION FirstName (Gender        IN CHAR,
                        MaxLength     IN NUMBER,
                        NullPercent   IN NUMBER)
        /* Gender values:
           - 'f', 'F' : Female
           - 'm', 'M' : Male
           - 'x', 'X' : Mixed */
        RETURN VARCHAR2;

    -- Returns a random full name
    FUNCTION FullName (Gender        IN CHAR,
                       Format        IN VARCHAR2,
                       MaxLength     IN NUMBER,
                       NullPercent   IN NUMBER)
        /* Gender values:
           - 'f', 'F' : Female
           - 'm', 'M' : Male
           - 'x', 'X' : Mixed

           Format values:
           - 'fl', 'FL'     : First Last
           - 'fml', 'FML'   : First Middle Last
           - 'fmil', 'FMIL' : First Middle Initial Last */
        RETURN VARCHAR2;

    -- Returns a random set of initials
    FUNCTION Initials (ALength IN NUMBER, NullPercent IN NUMBER)
        RETURN VARCHAR2;

    -- Returns a random international city (excluding US cities)
    FUNCTION IntlCity (Format        IN CHAR,
                       MaxLength     IN NUMBER,
                       NullPercent   IN NUMBER)
        /* Format values:
           - 'c', 'C' : City only
           - 'f', 'F' : Full city description (City, Country) */
        RETURN VARCHAR2;

    -- Returns a random international city (including US cities)
    FUNCTION IntlCityUS (Format        IN CHAR,
                         MaxLength     IN NUMBER,
                         NullPercent   IN NUMBER)
        /* Format values:
           - 'c', 'C' : City only
           - 'f', 'F' : Full city description (City, [State,] Country) */
        RETURN VARCHAR2;

    -- Returns a random job title
    FUNCTION JobTitle (MaxLength IN NUMBER, NullPercent IN NUMBER)
        RETURN VARCHAR2;

    -- Returns a random last name
    FUNCTION LastName (MaxLength IN NUMBER, NullPercent IN NUMBER)
        RETURN VARCHAR2;

    -- Returns a random nickname
    FUNCTION NickName (Gender        IN CHAR,
                       MaxLength     IN NUMBER,
                       NullPercent   IN NUMBER)
        /* Gender values:
           - 'f', 'F' : Female
           - 'm', 'M' : Male
           - 'x', 'X' : Mixed */
        RETURN VARCHAR2;

    -- Returns a phone extension of specified length
    FUNCTION PhoneExtension (ALength IN NUMBER, NullPercent IN NUMBER)
        RETURN VARCHAR2;

    -- Returns a random name prefix
    FUNCTION PrefixName (MaxLength IN NUMBER, NullPercent IN NUMBER)
        RETURN VARCHAR2;

    -- Returns a formatted Social Security value
    FUNCTION SocialSecurity (Format CHAR, NullPercent IN NUMBER)
        /* Format values:
             '4', '4' : Last 4 only
             'm', 'M' : Masked */
        RETURN VARCHAR2;

    -- Returns a random name suffix
    FUNCTION SuffixName (MaxLength IN NUMBER, NullPercent IN NUMBER)
        RETURN VARCHAR2;

    -- Returns a random US Address
    FUNCTION USAddress (Format        IN CHAR,
                        MaxLength     IN NUMBER,
                        NullPercent   IN NUMBER)
        /* Format values:
           - '1'      : Address 1
           - '2'      : Address 2
           - 'p', 'P' : P.O. Box
           - 'f', 'F' : Full address (Address1 + Address 2)  */
        RETURN VARCHAR2;

    -- Returns a random US City
    FUNCTION USCity (Format        IN CHAR,
                     MaxLength     IN NUMBER,
                     NullPercent   IN NUMBER)
        /* Format values:
           - 'c', 'C' : City only
           - 'f', 'F' : Full city description (City, State) */
        RETURN VARCHAR2;

    -- Returns a random UserID
    FUNCTION UserID (Format        IN CHAR,
                     MaxLength     IN NUMBER,
                     NullPercent   IN NUMBER)
        /* Format values:
           - '1' : <first>.<last>
           - '2' : <fi><last>
           - '3' : <first><li>
           - '4' : <fi>.<last>
           - 'x' : Mixed */
        RETURN VARCHAR2;


    -- Returns a random US telephone number
    FUNCTION USPhone (Format IN CHAR, NullPercent IN NUMBER)
        /* Format values:
           - 'd', 'D' : Dash separator       Ex: nnn-nnn-nnnn
           - 'p', 'P' : Use parentheses      Ex: (nnn) nnn-nnnn
           - 's', 'S' : Use slash separator  Ex: nnn/nnn-nnnn
           - 'n', 'N' : Use no separator     Ex: nnnnnnnnnn      */
        RETURN VARCHAR2;

    -- Returns a random US toll-free telephone number
    FUNCTION USPhoneTollFree (Format IN CHAR, NullPercent IN NUMBER)
        /* Format values:
           - 'd', 'D' : Dash separator       Ex: nnn-nnn-nnnn
           - 'p', 'P' : Use parentheses      Ex: (nnn) nnn-nnnn
           - 's', 'S' : Use slash separator  Ex: nnn/nnn-nnnn
           - 'n', 'N' : Use no separator     Ex: nnnnnnnnnn      */
        RETURN VARCHAR2;

    -- Returns a random US State
    FUNCTION USState (Format        IN CHAR,
                      MaxLength     IN NUMBER,
                      NullPercent   IN NUMBER)
        /* Format values:
           - 'a', 'A' : State abbreviation
           - 'f', 'F' : Full state description */
        RETURN VARCHAR2;

    -- Returns a random US Zip Code
    FUNCTION USZip (NullPercent IN NUMBER)
        RETURN VARCHAR2;

    -- Returns a random US Zip Code - Plus 4
    FUNCTION USZipPlus4 (Format IN CHAR, NullPercent IN NUMBER)
        /* Format values:
          - '4' : Plus-4 value only
          - 'f' : Full Zip-Plus4
          - 'n' : Full Zip-Plus4 without a separator */
        RETURN VARCHAR2;

    -- Returns a random Web URL
    FUNCTION WebURL (MaxLength IN NUMBER, NullPercent IN NUMBER)
        RETURN VARCHAR2;
END TEST_DATAGEN;
/