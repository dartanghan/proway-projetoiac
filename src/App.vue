<template>
  <div class="app">
    <header class="header">
      <h1>💎 Joalheria Elegante</h1>
      <p>Peças exclusivas em ouro e pedras preciosas</p>
    </header>

    <nav class="nav">
      <button @click="activeSection = 'home'" :class="{ active: activeSection === 'home' }">Início</button>
      <button @click="activeSection = 'products'" :class="{ active: activeSection === 'products' }">Produtos</button>
      <button @click="activeSection = 'about'" :class="{ active: activeSection === 'about' }">Sobre</button>
      <button @click="activeSection = 'contact'" :class="{ active: activeSection === 'contact' }">Contato</button>
    </nav>

    <main class="main">
      <section v-if="activeSection === 'home'" class="section">
        <h2>Bem-vindos à nossa Joalheria</h2>
        <div class="products-grid">
          <div v-for="product in featuredProducts" :key="product.id" class="product-card">
            <div class="product-image">{{ product.icon }}</div>
            <h3>{{ product.name }}</h3>
            <p class="price">{{ product.price }}</p>
          </div>
        </div>
      </section>

      <section v-if="activeSection === 'products'" class="section">
        <h2>Nossos Produtos</h2>
        <div class="products-grid">
          <div v-for="product in allProducts" :key="product.id" class="product-card">
            <div class="product-image">{{ product.icon }}</div>
            <h3>{{ product.name }}</h3>
            <p>{{ product.description }}</p>
            <p class="price">{{ product.price }}</p>
          </div>
        </div>
      </section>

      <section v-if="activeSection === 'about'" class="section">
        <h2>Sobre Nós</h2>
        <p>Há mais de 30 anos criando peças únicas e exclusivas. Nossa joalheria combina tradição e modernidade para oferecer as mais belas criações em ouro, prata e pedras preciosas.</p>
      </section>

      <section v-if="activeSection === 'contact'" class="section">
        <h2>Contato</h2>
        <div class="contact-info">
          <p>📍 Rua das Joias, 123 - Centro</p>
          <p>📞 (11) 9999-8888</p>
          <p>✉️ contato@joalheriaelegante.com</p>
          <p>🕒 Seg-Sex: 9h às 18h | Sáb: 9h às 14h</p>
        </div>
      </section>
    </main>

    <footer class="footer">
      <p>&copy; 2024 Joalheria Elegante - Todos os direitos reservados</p>
    </footer>
  </div>
</template>

<script>
import { ref } from 'vue'

export default {
  name: 'App',
  setup() {
    const activeSection = ref('home')
    
    const featuredProducts = ref([
      { id: 1, name: 'Anel de Ouro', price: 'R$ 2.500', icon: '💍' },
      { id: 2, name: 'Colar de Diamantes', price: 'R$ 8.900', icon: '📿' },
      { id: 3, name: 'Brincos de Pérola', price: 'R$ 1.200', icon: '👂' }
    ])

    const allProducts = ref([
      { id: 1, name: 'Anel de Ouro', description: 'Anel em ouro 18k com acabamento polido', price: 'R$ 2.500', icon: '💍' },
      { id: 2, name: 'Colar de Diamantes', description: 'Colar com diamantes naturais lapidados', price: 'R$ 8.900', icon: '📿' },
      { id: 3, name: 'Brincos de Pérola', description: 'Brincos com pérolas cultivadas', price: 'R$ 1.200', icon: '👂' },
      { id: 4, name: 'Pulseira de Prata', description: 'Pulseira em prata 925 com detalhes', price: 'R$ 890', icon: '⌚' },
      { id: 5, name: 'Pingente Coração', description: 'Pingente em ouro com formato de coração', price: 'R$ 650', icon: '💖' },
      { id: 6, name: 'Aliança Tradicional', description: 'Aliança clássica em ouro 18k', price: 'R$ 1.800', icon: '💒' }
    ])

    return {
      activeSection,
      featuredProducts,
      allProducts
    }
  }
}
</script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: 'Arial', sans-serif;
  background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
  min-height: 100vh;
}

.app {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

.header {
  background: linear-gradient(45deg, #1e3c72, #ffd700);
  color: white;
  text-align: center;
  padding: 2rem;
  box-shadow: 0 4px 8px rgba(0,0,0,0.2);
}

.header h1 {
  font-size: 2.5rem;
  margin-bottom: 0.5rem;
  text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
}

.header p {
  font-size: 1.1rem;
  opacity: 0.9;
}

.nav {
  background: #ffd700;
  display: flex;
  justify-content: center;
  padding: 1rem;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.nav button {
  background: transparent;
  border: 2px solid #1e3c72;
  color: #1e3c72;
  padding: 0.8rem 1.5rem;
  margin: 0 0.5rem;
  border-radius: 25px;
  cursor: pointer;
  font-weight: bold;
  transition: all 0.3s ease;
}

.nav button:hover,
.nav button.active {
  background: #1e3c72;
  color: #ffd700;
  transform: translateY(-2px);
}

.main {
  flex: 1;
  padding: 2rem;
  max-width: 1200px;
  margin: 0 auto;
  width: 100%;
}

.section {
  background: white;
  border-radius: 15px;
  padding: 2rem;
  box-shadow: 0 8px 16px rgba(0,0,0,0.1);
  border: 3px solid #ffd700;
}

.section h2 {
  color: #1e3c72;
  font-size: 2rem;
  margin-bottom: 1.5rem;
  text-align: center;
}

.products-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 1.5rem;
  margin-top: 2rem;
}

.product-card {
  background: linear-gradient(135deg, #f8f9fa, #e9ecef);
  border: 2px solid #ffd700;
  border-radius: 12px;
  padding: 1.5rem;
  text-align: center;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.product-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 12px 24px rgba(30, 60, 114, 0.2);
}

.product-image {
  font-size: 3rem;
  margin-bottom: 1rem;
}

.product-card h3 {
  color: #1e3c72;
  font-size: 1.3rem;
  margin-bottom: 0.5rem;
}

.product-card p {
  color: #666;
  margin-bottom: 0.5rem;
}

.price {
  color: #1e3c72 !important;
  font-size: 1.4rem !important;
  font-weight: bold !important;
}

.contact-info {
  background: #f8f9fa;
  border: 2px solid #ffd700;
  border-radius: 10px;
  padding: 2rem;
  margin-top: 1rem;
}

.contact-info p {
  color: #1e3c72;
  font-size: 1.1rem;
  margin-bottom: 1rem;
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.footer {
  background: #1e3c72;
  color: #ffd700;
  text-align: center;
  padding: 1.5rem;
  margin-top: auto;
}

@media (max-width: 768px) {
  .nav {
    flex-wrap: wrap;
  }
  
  .nav button {
    margin: 0.25rem;
    padding: 0.6rem 1rem;
  }
  
  .header h1 {
    font-size: 2rem;
  }
  
  .products-grid {
    grid-template-columns: 1fr;
  }
}
</style>
