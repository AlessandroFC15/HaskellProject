import System.IO

type Nome = String
type Idade = Int

data Pessoa = Pessoa {name :: Nome, 
                      age :: Idade} deriving (Show)

getPessoa nome idade = 
    Pessoa nome idade

{- inh <- openFile "" ReadMode
    outh <- openFile "" WriteMode
    mainloop inh outh
    hClose inh
    hClose outh
    
mainloop :: Handle -> Handle -> IO ()
mainloop inh outh = 
    do ineof <- hIsEOF inh
        if ineof
            then return ()
            else do inpStr <- hGetLine inh
                hPutStrLn outh (map toUpper inpStr)
                mainloop inh outh -}

escreverEstruturaEmArquivo pessoa nomeArquivo = do
    outh <- openFile nomeArquivo WriteMode
    hPutStrLn outh (name pessoa)
    hPutStrLn outh (show (age pessoa) :: String)
    hClose outh
    
lerArquivoEImprimirEstrutura :: IO()
lerArquivoEImprimirEstrutura = do
    inh <- openFile "ArquivoTexto.txt" ReadMode
    nome <- hGetLine inh
    idade <- hGetLine inh
    
    -- Lemos o arquivo de volta para a estrutura
    let estrutura = Pessoa nome (read idade :: Int)
    
    putStrLn $ "-- Estrutura Lida: "
    print $ estrutura
    
    hClose inh
    

main :: IO()
main = do
        putStrLn "\n1 :: LER DA ENTRADA PADRÃO"

        putStr "\nDigite seu nome: ";
        nome <- getLine;
        
        putStr "\nDigite sua idade: ";
        idade <- getLine;
        
        putStrLn "\n2 :: ARMAZENAR EM UMA ESTRUTURA"
        
        putStrLn "\n-- Armazenando dados na estrutura...";
        
        let pessoa = getPessoa nome (read idade :: Idade);
        
        putStrLn "\n>> Estrutura Armazenada: "
        
        print $ pessoa;
        
        putStrLn "\n-- Dados armazenados na estrutura";
        
        putStrLn "\n>> OK p/ continuar"
        pause <- getLine;
        
        putStrLn "\n3 :: ESCREVER DADOS EM UM ARQUIVO DE TEXTO"
        
        putStr "\nInsira nome do arquivo a ser criado: "
        nomeArquivo <- getLine
        
        putStrLn "\n-- Armazendo dados no arquivo ArquivoTexto.txt..."
        
        escreverEstruturaEmArquivo pessoa nomeArquivo
        
        putStrLn "-- Dados escritos no arquivo!"
        
        putStrLn "\nObs: Verifique a existência do arquivo e digite OK p/ continuar"
        
        pause <- getLine
        
        putStrLn "\n4 :: LER DO ARQUIVO TEXTO E ARMAZENAR NA ESTRUTURA"
        
        putStrLn "\n-- Lendo do arquivo de texto e armazendo em uma estrutura..."
        
        lerArquivoEImprimirEstrutura
        
        putStrLn "\n\n# Fim da execução #"
        
        