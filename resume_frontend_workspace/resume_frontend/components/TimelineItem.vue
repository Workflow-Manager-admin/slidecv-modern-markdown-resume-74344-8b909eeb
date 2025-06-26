<script setup lang="ts">
import { ref } from "vue";

// PUBLIC_INTERFACE
interface TimelineData {
  title: string;
  subtitle: string;
  period: string;
  description: string[];
  icon?: string;
  isLast?: boolean;
}

const props = defineProps<{
  item: TimelineData;
  index?: number;
}>();

const isVisible = ref(false);

// Animation trigger on mount
setTimeout(() => {
  isVisible.value = true;
}, (props.index || 0) * 200);
</script>

<template>
  <div class="timeline-item" :class="{ visible: isVisible }">
    <div class="timeline-connector">
      <div class="timeline-dot">
        <span v-if="item.icon" class="timeline-icon">{{ item.icon }}</span>
        <div v-else class="timeline-circle"></div>
      </div>
      <div v-if="!item.isLast" class="timeline-line"></div>
    </div>

    <div class="timeline-content">
      <div class="timeline-header">
        <h3 class="timeline-title">{{ item.title }}</h3>
        <span class="timeline-period">{{ item.period }}</span>
      </div>

      <h4 class="timeline-subtitle">{{ item.subtitle }}</h4>

      <ul class="timeline-description">
        <li
          v-for="(desc, descIndex) in item.description"
          :key="descIndex"
          class="timeline-desc-item"
        >
          {{ desc }}
        </li>
      </ul>
    </div>
  </div>
</template>

<style scoped>
.timeline-item {
  display: flex;
  gap: 1.5rem;
  margin-bottom: 2rem;
  opacity: 0;
  transform: translateX(-30px);
  transition: all 0.6s ease-out;
}

.timeline-item.visible {
  opacity: 1;
  transform: translateX(0);
}

.timeline-connector {
  display: flex;
  flex-direction: column;
  align-items: center;
  flex-shrink: 0;
}

.timeline-dot {
  width: 3rem;
  height: 3rem;
  border-radius: 50%;
  background: linear-gradient(135deg, #4f8cff, #6ba3ff);
  display: flex;
  align-items: center;
  justify-content: center;
  box-shadow: 0 4px 12px rgba(79, 140, 255, 0.3);
  position: relative;
  z-index: 2;
}

.timeline-icon {
  font-size: 1.2rem;
  color: white;
}

.timeline-circle {
  width: 1rem;
  height: 1rem;
  background: white;
  border-radius: 50%;
}

.timeline-line {
  width: 2px;
  flex: 1;
  background: linear-gradient(to bottom, #4f8cff, rgba(79, 140, 255, 0.3));
  margin-top: 0.5rem;
  min-height: 2rem;
}

.timeline-content {
  flex: 1;
  padding-top: 0.25rem;
}

.timeline-header {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin-bottom: 0.5rem;
  gap: 1rem;
}

.timeline-title {
  color: #1a1b1e;
  font-size: 1.25rem;
  font-weight: 600;
  margin: 0;
  line-height: 1.3;
}

.timeline-period {
  color: #4f8cff;
  font-size: 0.85rem;
  font-weight: 500;
  background: rgba(79, 140, 255, 0.1);
  padding: 0.25rem 0.75rem;
  border-radius: 1rem;
  white-space: nowrap;
}

.timeline-subtitle {
  color: #1a1b1e;
  font-size: 1rem;
  font-weight: 500;
  margin: 0 0 1rem 0;
  opacity: 0.8;
}

.timeline-description {
  list-style: none;
  margin: 0;
  padding: 0;
}

.timeline-desc-item {
  color: #1a1b1e;
  font-size: 0.95rem;
  line-height: 1.6;
  margin-bottom: 0.5rem;
  padding-left: 1rem;
  position: relative;
  opacity: 0.9;
}

.timeline-desc-item::before {
  content: "▸";
  color: #4f8cff;
  position: absolute;
  left: 0;
  font-weight: bold;
}

/* Responsive design */
@media (max-width: 768px) {
  .timeline-item {
    gap: 1rem;
  }

  .timeline-dot {
    width: 2.5rem;
    height: 2.5rem;
  }

  .timeline-header {
    flex-direction: column;
    gap: 0.5rem;
  }

  .timeline-period {
    align-self: flex-start;
  }

  .timeline-title {
    font-size: 1.1rem;
  }
}
</style>
