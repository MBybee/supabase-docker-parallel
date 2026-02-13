FROM alpine:latest

COPY --from=postgrest/postgrest:v14.3 /bin/postgrest /bin

ENV VERSION=14.3

ENV PGRST_DB_ANON_ROLE=anon
ENV PGRST_DB_SCHEMAS=public,storage,graphql_public
ENV JWT_EXPIRY=3600
ENV PGRST_DB_USE_LEGACY_GUCS=false

COPY --chmod=0755 entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
CMD ["postgrest"]