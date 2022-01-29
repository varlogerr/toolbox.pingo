# Pingo tool

Ping tool

## Installation

```sh
# clone the repository
sudo git clone https://github.com/varlogerr/toolbox.pingo.git /opt/varlog/toolbox.pingo
# check pathadd.append function is installed
type -t pathadd.append
# in case output is "function" you can make use
# of pathadd-based bash hook. Otherwise add
# '/opt/varlog/toolbox.pingo/bin' directory
# to the PATH manually
echo '. /opt/varlog/toolbox.pingo/hook-pathadd.bash' >> ~/.bashrc
# reload ~/.bashrc
. ~/.bashrc
# expore the script
pingo.sh -h
```

## References

* [`pathadd` tool](https://github.com/varlogerr/toolbox.pathadd)
