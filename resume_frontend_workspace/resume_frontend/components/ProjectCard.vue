<script setup lang="ts">
import { ref, computed } from "vue";

// PUBLIC_INTERFACE
interface Project {
  title: string;
  description: string;
  technologies: string[];
  year: string;
  link?: string;
  github?: string;
  features?: string[];
  impact?: string;
  image?: string;
}

const props = defineProps<{
  project: Project;
  index?: number;
}>();

const isHovered = ref(false);
const cardRef = ref<HTMLElement>();

const cardDelay = computed(() => `${(props.index || 0) * 0.15}s`);

// PUBLIC_INTERFACE
const openLink = (url: string) => {
  /**
   * Opens project link in new tab
   */
  window.open(url, "_blank", "noopener,noreferrer");
};
</script>

<template>
  <div
    ref="cardRef"
    class="project-card"
    :style="{ animationDelay: cardDelay }"
    @mouseenter="isHovered = true"
    @mouseleave="isHovered = false"
  >
    <div class="card-header">
      <h3 class="project-title">{{ project.title }}</h3>
      <div class="project-year">{{ project.year }}</div>
    </div>

    <div class="project-description">
      {{ project.description }}
    </div>

    <div v-if="project.features" class="project-features">
      <h4 class="features-title">Key Features:</h4>
      <ul class="features-list">
        <li
          v-for="(feature, featureIndex) in project.features"
          :key="featureIndex"
          class="feature-item"
        >
          {{ feature }}
        </li>
      </ul>
    </div>

    <div v-if="project.impact" class="project-impact">
      <strong>Impact:</strong> {{ project.impact }}
    </div>

    <div class="project-technologies">
      <span
        v-for="(tech, techIndex) in project.technologies"
        :key="techIndex"
        class="tech-tag"
      >
        {{ tech }}
      </span>
    </div>

    <div v-if="project.link || project.github" class="project-links">
      <button
        v-if="project.link"
        class="project-btn primary"
        @click="openLink(project.link)"
      >
        🔗 View Project
      </button>
      <button
        v-if="project.github"
        class="project-btn secondary"
        @click="openLink(project.github)"
      >
        💻 GitHub
      </button>
    </div>
  </div>
</template>

<style scoped>
.project-card {
  background: white;
  border-radius: 16px;
  padding: 2rem;
  box-shadow: 0 4px 20px rgba(26, 27, 30, 0.08);
  border: 1px solid rgba(79, 140, 255, 0.1);
  transition: all 0.3s ease;
  opacity: 0;
  transform: translateY(30px);
  animation: slideUp 0.8s ease-out forwards;
  height: fit-content;
}

@keyframes slideUp {
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.project-card:hover {
  transform: translateY(-8px);
  box-shadow: 0 12px 40px rgba(79, 140, 255, 0.15);
  border-color: rgba(79, 140, 255, 0.3);
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin-bottom: 1rem;
  gap: 1rem;
}

.project-title {
  color: #1a1b1e;
  font-size: 1.5rem;
  font-weight: 700;
  margin: 0;
  line-height: 1.3;
}

.project-year {
  background: linear-gradient(135deg, #4f8cff, #6ba3ff);
  color: white;
  padding: 0.375rem 0.875rem;
  border-radius: 20px;
  font-size: 0.8rem;
  font-weight: 600;
  white-space: nowrap;
}

.project-description {
  color: #1a1b1e;
  font-size: 1rem;
  line-height: 1.6;
  margin-bottom: 1.5rem;
  opacity: 0.85;
}

.project-features {
  margin-bottom: 1.5rem;
}

.features-title {
  color: #4f8cff;
  font-size: 0.9rem;
  font-weight: 600;
  margin: 0 0 0.75rem 0;
}

.features-list {
  list-style: none;
  margin: 0;
  padding: 0;
}

.feature-item {
  color: #1a1b1e;
  font-size: 0.9rem;
  line-height: 1.5;
  margin-bottom: 0.4rem;
  padding-left: 1rem;
  position: relative;
  opacity: 0.8;
}

.feature-item::before {
  content: "✦";
  color: #4f8cff;
  position: absolute;
  left: 0;
  font-size: 0.7rem;
}

.project-impact {
  background: rgba(79, 140, 255, 0.05);
  padding: 1rem;
  border-radius: 12px;
  margin-bottom: 1.5rem;
  border-left: 4px solid #4f8cff;
  color: #1a1b1e;
  font-size: 0.9rem;
  line-height: 1.5;
}

.project-impact strong {
  color: #4f8cff;
}

.project-technologies {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
  margin-bottom: 1.5rem;
}

.tech-tag {
  background: rgba(79, 140, 255, 0.1);
  color: #4f8cff;
  padding: 0.375rem 0.75rem;
  border-radius: 20px;
  font-size: 0.8rem;
  font-weight: 500;
  transition: all 0.2s ease;
}

.tech-tag:hover {
  background: rgba(79, 140, 255, 0.2);
  transform: scale(1.05);
}

.project-links {
  display: flex;
  gap: 0.75rem;
  flex-wrap: wrap;
}

.project-btn {
  padding: 0.75rem 1.5rem;
  border-radius: 12px;
  font-size: 0.9rem;
  font-weight: 600;
  border: none;
  cursor: pointer;
  transition: all 0.2s ease;
  text-decoration: none;
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
}

.project-btn.primary {
  background: linear-gradient(135deg, #4f8cff, #6ba3ff);
  color: white;
}

.project-btn.primary:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(79, 140, 255, 0.3);
}

.project-btn.secondary {
  background: white;
  color: #4f8cff;
  border: 2px solid #4f8cff;
}

.project-btn.secondary:hover {
  background: #4f8cff;
  color: white;
  transform: translateY(-2px);
}

/* Responsive design */
@media (max-width: 768px) {
  .project-card {
    padding: 1.5rem;
  }

  .card-header {
    flex-direction: column;
    gap: 0.75rem;
  }

  .project-year {
    align-self: flex-start;
  }

  .project-title {
    font-size: 1.3rem;
  }

  .project-links {
    flex-direction: column;
  }

  .project-btn {
    text-align: center;
    justify-content: center;
  }
}
</style>
