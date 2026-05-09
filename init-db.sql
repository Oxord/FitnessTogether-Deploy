-- Initialize PostgreSQL database with pgvector extension
-- This script runs automatically when the container starts for the first time

-- Enable pgvector extension
CREATE EXTENSION IF NOT EXISTS vector;

-- Create table for document embeddings
CREATE TABLE IF NOT EXISTS documents (
    id SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    metadata JSONB,
    embedding vector(768),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Log successful initialization
DO $$
BEGIN
    RAISE NOTICE 'PostgreSQL with pgvector initialized successfully';
END $$;
