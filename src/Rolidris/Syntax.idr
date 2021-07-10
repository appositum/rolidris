module Rolidris.Syntax

%access public export

Name : Type
Name = List Char

data Literal = LInt Int
             | LBool Bool

Map : Type -> Type -> Type
Map a b = List (a, b)

mutual
  Env : Type
  Env = Map Name AST
  
  data AST = Var Name
           | Lam Name AST
           | Cls Name AST Env
           | Lit Literal

 Show AST where
   show (Var a)         = pack a
   show (Lit (LInt n))  = show n
   show (Lit (LBool b)) = show b
   show (Lam [a] ast)     = pack $ ['(', a, '.'] ++ unpack (show ast) ++ [')']
   show (Cls [a] ast _)   = pack $ ['(', a, '.'] ++ unpack (show ast) ++ [')']
