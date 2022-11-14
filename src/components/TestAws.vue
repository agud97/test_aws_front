<template>
    <div>
        <div v-for="(item, index) in data" :key="index">
            <span>{{ item.id }}</span>
            <span>{{ item.text }}</span>
        </div>
    </div>
</template>

<script setup>
import { ref, onMounted } from '@vue/runtime-core';
import API_SERVER from '../http-common';

const data =ref([]);

onMounted( async ()=>{
    const response = await API_SERVER.get('/');
    if(response){
        response.data.forEach(element => {
            data.value.push(element);
        });
    }
});
</script>