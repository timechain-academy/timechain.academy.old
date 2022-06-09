# Copyright (c) 2016-2021 Martin Donath <martin.donath@squidfunk.com>

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to
# deal in the Software without restriction, including without limitation the
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
# sell copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
# IN THE SOFTWARE.

FROM docker.io/minidocks/mkdocs:latest
VOLUME /root/mkdocs
WORKDIR /root
VOLUME /root/mkdocs
VOLUME /root/docs
RUN mkdir -p /root/mkdocs
RUN mkdir -p /root/docs

# Expose MkDocs development server port
EXPOSE 18000
ARG PRIVATE
ARG PRIVATE_BITCOINBOOK
ARG PRIVATE_LNBOOK
ENV PRIVATE=${PRIVATE}
ENV PRIVATE_BITCOINBOOK=${PRIVATE_BITCOINBOOK}
ENV PRIVATE_LNBOOK=${PRIVATE_LNBOOK}
RUN echo "$PRIVATE"
RUN echo $PRIVATE
RUN echo "${PRIVATE}"

# Start development server by default
ENTRYPOINT ["mkdocs"]
CMD [ "-v", "serve", "--dirtyreload", "-a", "0.0.0.0:18000", "-t", "material" ]

