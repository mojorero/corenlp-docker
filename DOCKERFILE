FROM java:jre-alpine
MAINTAINER mojorero
RUN apk add --update --no-cache \
	 unzip \
	 wget

RUN wget http://nlp.stanford.edu/software/stanford-corenlp-latest.zip

RUN unzip stanford-corenlp-latest.zip && \
	rm stanford-corenlp-latest.zip

WORKDIR stanford-corenlp-latest.zip

RUN wget http://nlp.stanford.edu/software/stanford-corenlp-4.0.0-models-german.jar

RUN export CLASSPATH="`find . -name '*.jar'`"

ENV PORT 9000
EXPOSE $PORT

CMD java -cp "*" -mx4g edu.stanford.nlp.pipeline.StanfordCoreNLPServer