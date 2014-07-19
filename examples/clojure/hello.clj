(defn hello
  [&rest]
  (-> (Observable/from &rest)
    (.subscribe #(println (str "Hello " % "!")))))
