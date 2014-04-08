{
 :user {:plugins [[joodo/lein-joodo "0.10.0"]
                  [lein-kibit "0.0.8"]
              ;    [fractal-ext "0.1.0-SNAPSHOT"]
                  ]
        :dependencies [[slamhound "1.5.1"]
                       [im.chit/vinyasa "0.1.8"]]
        :injections [(require 'vinyasa.inject)
                     (vinyasa.inject/inject 'clojure.core '>
                       '[[clojure.repl doc source]
                         [clojure.pprint pprint pp]])]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}
        }
 }
