set -o errexit

echo "🔧 Iniciando build no Render..."

# Instala bundler se necessário
gem install bundler

# Instala gems
bundle install

# Remove dependências do banco se existirem
if grep -q "gem 'pg'" Gemfile; then
  echo "⚠️  Removendo PostgreSQL do Gemfile..."
  sed -i "/gem 'pg'/d" Gemfile
  bundle install
fi

# Compila assets se tiver
if [ -d app/assets ]; then
  echo "📦 Compilando assets..."
  bundle exec rails assets:precompile
fi

echo "✅ Build completo!"