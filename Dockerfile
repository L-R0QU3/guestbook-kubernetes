FROM node:20-alpine
WORKDIR /app
# Copy package files
COPY package*.json ./
# Install dependencies
RUN npm install --only=production
# Copy application source
COPY server.js ./
COPY public ./public/
# Create non-root user
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodeuser -u 1001
RUN chown -R nodeuser:nodejs /app
USER nodeuser
EXPOSE 3000
CMD ["node", "server.js"]