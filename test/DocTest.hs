{-# LANGUAGE ScopedTypeVariables #-}

module Main (main) where

import Text.EmailAddress (EmailAddress)

import Prelude
import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.QuickCheck (testProperty)
import Data.Aeson (FromJSON, ToJSON)
import qualified Data.Aeson as Aeson


main :: IO ()
main = defaultMain $ testProperty "Email"
  (\(x :: EmailAddress) -> jsonIso x)



    
jsonIso :: FromJSON a => ToJSON a => Eq a => a -> Bool
jsonIso x = Just x == Aeson.decode (Aeson.encode x)
