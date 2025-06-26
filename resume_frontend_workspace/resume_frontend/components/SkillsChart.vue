<script setup lang="ts">
// PUBLIC_INTERFACE
interface Skill {
  name: string;
  level: number;
  category?: string;
}

defineProps<{
  skills: Skill[];
  title?: string;
}>();

const animationDelay = (index: number) => `${index * 0.1}s`;
</script>

<template>
  <div class="skills-chart">
    <h3 v-if="title" class="chart-title">{{ title }}</h3>

    <div class="skills-grid">
      <div
        v-for="(skill, index) in skills"
        :key="skill.name"
        class="skill-item"
        :style="{ animationDelay: animationDelay(index) }"
      >
        <div class="skill-header">
          <span class="skill-name">{{ skill.name }}</span>
          <span class="skill-percentage">{{ skill.level }}%</span>
        </div>

        <div class="skill-bar">
          <div
            class="skill-progress"
            :style="{ width: `${skill.level}%` }"
          ></div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.skills-chart {
  width: 100%;
  padding: 1.5rem;
}

.chart-title {
  color: #4f8cff;
  font-size: 1.5rem;
  font-weight: 600;
  margin-bottom: 2rem;
  text-align: center;
}

.skills-grid {
  display: grid;
  gap: 1.25rem;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
}

.skill-item {
  opacity: 0;
  animation: fadeInUp 0.6s ease-out forwards;
}

@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.skill-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 0.5rem;
}

.skill-name {
  color: #1a1b1e;
  font-weight: 500;
  font-size: 0.95rem;
}

.skill-percentage {
  color: #4f8cff;
  font-weight: 600;
  font-size: 0.85rem;
}

.skill-bar {
  height: 8px;
  background-color: rgba(79, 140, 255, 0.1);
  border-radius: 6px;
  overflow: hidden;
  position: relative;
}

.skill-progress {
  height: 100%;
  background: linear-gradient(90deg, #4f8cff, #6ba3ff);
  border-radius: 6px;
  transition: width 1.2s ease-out;
  position: relative;
}

.skill-progress::after {
  content: "";
  position: absolute;
  top: 0;
  right: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(
    90deg,
    transparent,
    rgba(255, 255, 255, 0.3),
    transparent
  );
  animation: shimmer 2s infinite;
}

@keyframes shimmer {
  0% {
    transform: translateX(-100%);
  }
  100% {
    transform: translateX(100%);
  }
}

/* Responsive design */
@media (max-width: 768px) {
  .skills-grid {
    grid-template-columns: 1fr;
  }

  .skills-chart {
    padding: 1rem;
  }
}
</style>
