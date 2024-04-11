import { configureStore } from '@reduxjs/toolkit';
// import userReducer from '../features/user/userSlice';
// import postsReducer from '../features/posts/postsSlice';

export const store = configureStore({
  reducer: {
    // user: userReducer,
    // posts: postsReducer,
    // Add other reducers here
  },
});

export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;
